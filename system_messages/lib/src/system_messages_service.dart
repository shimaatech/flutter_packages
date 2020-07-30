import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repository/repository.dart';
import 'package:serializer/serializer.dart';

import '../system_messages.dart';

/// We are using firestore directly here instead of FirestoreRepository.
/// This is because the RemoteRepository doesn't support complex queries
/// it supports the equals operator only and it doesn't support streaming also
/// (less important)
class SystemMessagesService {
  static const String collectionName = 'system_messages';
  static const String dismissedMessagesKey =
      'systemMessagesService.dismissedMessages';

  SystemMessagesService(this.firestore, this.storage, this.langCode,
      this.appPackage, this.appVersion,
      {this.testMode = false});

  final Firestore firestore;
  final LocalStorage storage;
  final String langCode;
  final String appPackage;
  final double appVersion;
  final bool testMode;
  final JsonConverter<DateTime, String> dateConverter = UtcIsoDateConverter();

  Future<SystemMessage> getLatestUnexpiredMessage(
      SystemMessageType type) async {
    // get one non-expired message only
    List<DocumentSnapshot> snapshots = (await firestore
            .collection(collectionName)
            .where('expirationDate', isGreaterThanOrEqualTo: DateTime.now())
            .where('langCode', isEqualTo: langCode)
            .where('type', isEqualTo: describeEnum(type))
            .where('package', isEqualTo: appPackage)
            .where('maxAppVersion', isLessThanOrEqualTo: appVersion)
            .where('minAppVersion', isGreaterThanOrEqualTo: appVersion)
            .where('testMode', isEqualTo: testMode)
            .limit(1)
            .getDocuments())
        .documents;

    for (DocumentSnapshot snapshot in snapshots) {
      Map<String, dynamic> data = snapshot.data;
      // convert Firestore timestamp to Date...
      // Not sure if this is the correct way... But we cannot change the to/from
      // Json of system message just because of Firestore...
      if (data.containsKey('expirationDate')) {
        data['expirationDate'] = dateConverter
            .toJson((data['expirationDate'] as Timestamp).toDate());
      }
      SystemMessage message = SystemMessage.serializer.deserialize(data);
      if (!isMessageDismissed(message)) {
        return message;
      }
    }
    return null;
  }

  Future<void> dismissMessage(String id) {
    return storage.save<List<String>>(dismissedMessagesKey,
        List<String>.from(getDismissedMessages())..add(id));
  }

  @protected
  bool isMessageDismissed(SystemMessage message) {
    return getDismissedMessages().contains(message.id);
  }

  List<String> getDismissedMessages() {
    return storage.get<List<String>>(dismissedMessagesKey, const []);
  }
}
