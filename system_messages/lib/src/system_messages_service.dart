import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repository/repository.dart';
import 'package:serializer/serializer.dart';

import '../system_messages.dart';
import '../system_messages.dart';

/// We are using firestore directly here instead of FirestoreRepository.
/// This is because the RemoteRepository doesn't support complex queries
/// it supports the equals operator only and it doesn't support streaming also
/// (less important)
class SystemMessagesService {
  static const String collectionName = 'system_messages';
  static const String dismissedMessagesKey =
      'systemMessagesService.dismissedMessages';

  SystemMessagesService(this.firestore, this.storage);

  final Firestore firestore;
  final LocalStorage storage;
  final JsonConverter<DateTime, String> dateConverter = UtcIsoDateConverter();

  Future<SystemMessage> getLatestUnexpiredMessage(
      String langCode, SystemMessageType type) async {
    // get one non-expired message only
    List<DocumentSnapshot> snapshots = (await firestore
            .collection(collectionName)
            .where('expirationDate',
                isGreaterThanOrEqualTo: dateConverter.toJson(DateTime.now()))
            .where('langCode', isEqualTo: langCode)
            .where('type', isEqualTo: describeEnum(type))
            .limit(1)
            .getDocuments())
        .documents;

    if (snapshots.isNotEmpty) {
      SystemMessage message =
          SystemMessage.serializer.deserialize(snapshots.first.data);
      if (!isMessageDismissed(message)) {
        return message;
      }
    }
    return null;
  }

  Future<void> dismissMessage(String id) {
    return storage.save(dismissedMessagesKey, getDismissedMessages()..add(id));
  }

  @protected
  bool isMessageDismissed(SystemMessage message) {
    return getDismissedMessages().contains(message.id);
  }

  List<String> getDismissedMessages() {
    return storage.get<List<String>>(dismissedMessagesKey, const []);
  }
}
