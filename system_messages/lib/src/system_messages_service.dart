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

  // TODO I think that langCode should not be passed to constructor... It should
  // be passed to the method that fetches the messages
  SystemMessagesService(
    this.firestore,
    this.storage,
    this.package,
    this.appVersion,
    this.installedBefore, {
    this.testMode = false,
  });

  final FirebaseFirestore firestore;
  final LocalStorage storage;
  final String package;
  final double appVersion;
  final bool testMode;
  final DateTime installedBefore;
  final JsonConverter<DateTime, String> dateConverter = UtcIsoDateConverter();

  List<String> getPackages(List<String> additionalPackages) {
    if (additionalPackages == null) {
      return [package];
    }
    return additionalPackages + [package];
  }

  Future<SystemMessage> getLatestUnexpiredMessage(
    SystemMessageType type,
    String langCode,
    Duration fetchInterval, {
    List<String> additionalPackages = const [],
  }) async {
    final packages = getPackages(additionalPackages);

    if (!needToFetch(fetchInterval)) {
      return getLastMessage(type, packages);
    }

    // get one non-expired message only
    List<DocumentSnapshot> snapshots = (await firestore
            .collection(collectionName)
            .where('expirationTime', isGreaterThanOrEqualTo: DateTime.now())
            .where('langCode', isEqualTo: langCode)
            .where('type', isEqualTo: describeEnum(type))
            .where('package', whereIn: packages)
            .where('testMode', isEqualTo: testMode)
            .limit(20)
            .get())
        .docs;

    markFetched();

    for (DocumentSnapshot snapshot in snapshots) {
      Map<String, dynamic> data = snapshot.data();
      // convert Firestore timestamp to Date...
      // Not sure if this is the correct way... But we cannot change the to/from
      // Json of system message just because of Firestore...
      if (data.containsKey('expirationTime')) {
        data['expirationTime'] = dateConverter
            .toJson((data['expirationTime'] as Timestamp).toDate());
      }
      if (data.containsKey('startTime')) {
        data['startTime'] =
            dateConverter.toJson((data['startTime'] as Timestamp).toDate());
      }
      if (data.containsKey('installedBefore')) {
        data['installedBefore'] = dateConverter
            .toJson((data['installedBefore'] as Timestamp).toDate());
      }

      SystemMessage message =
          SystemMessage.serializer.deserialize(data).copyWith(id: snapshot.id);
      // we check the app version here and not in the query because firestore
      // queries do not allow having multiple whereEqualTo queries on different
      // fields
      if (isValidMessage(message, packages)) {
        // save last message (because we don't always fetch from firebase)
        return saveLastMessage(message);
      }
    }
    return getLastMessage(type, additionalPackages);
  }

  bool isValidMessage(SystemMessage message, List<String> packages) =>
      message != null &&
      !isMessageDismissed(message) &&
      isApplicableForAppVersion(message) &&
      isApplicableForPackages(message, packages) &&
      !isExpired(message) &&
      isStartTimeValid(message) &&
      isInstalledBeforeValid(message);

  bool isStartTimeValid(SystemMessage message) {
    if (message.startTime == null) {
      return true;
    }
    return message.startTime.isBefore(DateTime.now());
  }

  bool isInstalledBeforeValid(SystemMessage message) {
    if (message.installedBefore == null) {
      return true;
    }
    return message.installedBefore.isAfter(installedBefore);
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

  bool needToFetch(Duration fetchInterval) {
    if (testMode) {
      // always fetch in test mode
      return true;
    }
    DateTime lastCheckTime = storage.get<DateTime>(lastCheckKey);
    return lastCheckTime == null ||
        DateTime.now().difference(lastCheckTime) >= fetchInterval;
  }

  Future<void> markFetched() {
    return storage.save<DateTime>(lastCheckKey, DateTime.now());
  }

  bool isApplicableForAppVersion(SystemMessage message) {
    assert(message.minAppVersion != null && message.maxAppVersion != null);
    return appVersion >= message.minAppVersion &&
        appVersion <= message.maxAppVersion;
  }

  bool isApplicableForPackages(SystemMessage message, List<String> packages) {
    return message.appsIds.any((appId) => packages.contains(appId));
  }

  /// save last message so that it will be shown to the user if not dismissed
  /// because we don't always fetch messages from firestore
  Future<SystemMessage> saveLastMessage(SystemMessage message) async {
    await storage.save<SystemMessage>(
        getMessageStorageKey(message.type), message);
    return message;
  }

  /// return last message if is applicable and not expired or dismissed yet
  Future<SystemMessage> getLastMessage(
      SystemMessageType type, List<String> packages) async {
    String key = getMessageStorageKey(type);
    SystemMessage message = storage.get<SystemMessage>(key);
    if (isValidMessage(message, packages)) {
      return message;
    } else {
      if (message != null) {
        await storage.remove(key);
      }
      return null;
    }
  }

  bool isExpired(SystemMessage message) {
    return message.expirationTime.isBefore(DateTime.now());
  }

  String getMessageStorageKey(SystemMessageType type) {
    return "$lastMessageKey.${describeEnum(type)}";
  }
}
