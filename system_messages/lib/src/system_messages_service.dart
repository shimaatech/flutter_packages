import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repository/repository.dart';
import 'package:serializer/serializer.dart';

import '../system_messages.dart';

// TODO add country to the system message...

/// We are using firestore directly here instead of FirestoreRepository.
/// This is because the RemoteRepository doesn't support complex queries
/// it supports the equals operator only and it doesn't support streaming also
/// (less important)
class SystemMessagesService {
  static const String collectionName = 'system_messages';
  static const String dismissedMessagesKey =
      'systemMessagesService.dismissedMessages';
  static const String lastCheckKey = 'systemMessageService.lastCheck';
  static const String lastMessageKey = 'systemMessageService.lastMessage';

  /// interval in days for fetching from firestore
  static const int defaultFetchDaysInterval = 1;

  SystemMessagesService(this.firestore, this.storage, this.langCode,
      this.appPackage, this.appVersion,
      {this.fetchDaysInterval = defaultFetchDaysInterval,
      this.testMode = false});

  final Firestore firestore;
  final LocalStorage storage;
  final String langCode;
  final String appPackage;
  final double appVersion;
  final bool testMode;
  final int fetchDaysInterval;
  final JsonConverter<DateTime, String> dateConverter = UtcIsoDateConverter();

  SystemMessage lastMessage;

  Future<SystemMessage> getLatestUnexpiredMessage(
      SystemMessageType type) async {
    // fetch once a day only because we may retrieve many documents due to
    // firestore queries limitation
    if (!needToFetch()) {
      return null;
    }

    // get one non-expired message only
    List<DocumentSnapshot> snapshots = (await firestore
            .collection(collectionName)
            .where('expirationDate', isGreaterThanOrEqualTo: DateTime.now())
            .where('langCode', isEqualTo: langCode)
            .where('type', isEqualTo: describeEnum(type))
            .where('package', isEqualTo: appPackage)
            .where('testMode', isEqualTo: testMode)
            .limit(1)
            .getDocuments())
        .documents;

    // TODO do wen need to await here?
    await markFetched();

    for (DocumentSnapshot snapshot in snapshots) {
      Map<String, dynamic> data = snapshot.data;
      // convert Firestore timestamp to Date...
      // Not sure if this is the correct way... But we cannot change the to/from
      // Json of system message just because of Firestore...
      if (data.containsKey('expirationDate')) {
        data['expirationDate'] = dateConverter
            .toJson((data['expirationDate'] as Timestamp).toDate());
      }
      SystemMessage message = SystemMessage.serializer
          .deserialize(data)
          .copyWith(id: snapshot.documentID);
      // we check the app version here and not in the query because firestore
      // queries do not allow having multiple whereEqualTo queries on different
      // fields
      if (!isMessageDismissed(message) && isApplicableForAppVersion(message)) {
        // save last message (because we don't always fetch from firebase)
        return saveLastMessage(message);
      }
    }
    return getLastMessage();
  }

  Future<void> dismissMessage(String id) {
    return storage.save<StringList>(dismissedMessagesKey,
        StringList(List.from(getDismissedMessages())..add(id)));
  }

  @protected
  bool isMessageDismissed(SystemMessage message) {
    return getDismissedMessages().contains(message.id);
  }

  List<String> getDismissedMessages() {
    return storage
        .get<StringList>(dismissedMessagesKey, StringList(const []))
        .data;
  }

  bool needToFetch() {
    if (testMode) {
      // always fetch in test mode
      return true;
    }
    DateTime lastCheckTime = storage.get<DateTime>(lastCheckKey);
    return lastCheckTime == null ||
        DateTime.now().difference(lastCheckTime).inDays >= fetchDaysInterval;
  }

  Future<void> markFetched() {
    return storage.save<DateTime>(lastCheckKey, DateTime.now());
  }

  bool isApplicableForAppVersion(SystemMessage message) {
    assert(message.minAppVersion != null && message.maxAppVersion != null);
    return appVersion >= message.minAppVersion &&
        appVersion <= message.maxAppVersion;
  }

  /// save last message so that it will be shown to the user if not dismissed
  /// because we don't always fetch messages from firestore
  Future<SystemMessage> saveLastMessage(SystemMessage message) async {
    await storage.save<SystemMessage>(lastMessageKey, message);
    return message;
  }

  /// return last message if is applicable and not expired or dismissed yet
  Future<SystemMessage> getLastMessage() async {
    SystemMessage message = storage.get<SystemMessage>(lastMessageKey);
    if (message != null &&
        !isExpired(message) &&
        !isMessageDismissed(message) &&
        isApplicableForAppVersion(message)) {
      return message;
    } else {
      if (message != null) {
        await storage.remove(lastMessageKey);
      }
      return null;
    }
  }

  bool isExpired(SystemMessage message) {
    return message.expirationDate.isBefore(DateTime.now());
  }
}
