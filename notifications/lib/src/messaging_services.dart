import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

Logger _logger = Logger();

enum NotificationType { system, upgrade, rate, other }

class NotificationMessage {
  final Map data;
  final String title;
  final String body;
  final NotificationType type;

  NotificationMessage(this.data, {this.title, this.body})
      : type = getNotificationType(data);

  @override
  String toString() {
    return jsonEncode({
      'title': title,
      'body': body,
      'data': data,
      'type': describeEnum(type)
    });
  }

  static NotificationType getNotificationType(Map data) {
    if (data == null || data['type'] == null) {
      return NotificationType.other;
    }
    NotificationType type = NotificationType.values
        .firstWhere((e) => describeEnum(e) == data['type']);
    return type ?? NotificationType.other;
  }
}

abstract class MessagingServices {
  @protected
  BehaviorSubject<NotificationMessage> messageReceivedSubject =
      BehaviorSubject();

  @protected
  BehaviorSubject<NotificationMessage> notificationClickedSubject =
      BehaviorSubject();

  Stream<NotificationMessage> get onMessageReceived =>
      messageReceivedSubject.stream;

  Stream<NotificationMessage> get onNotificationClicked =>
      notificationClickedSubject.stream;

  Future<void> subscribeTo(List<String> topics);

  Future<void> unsubscribeFrom(List<String> topics);

  Future<void> dispose() async {
    notificationClickedSubject.close();
    messageReceivedSubject.close();
  }

  Future<NotificationMessage> getInitialNotification();

  Future<void> initialize();
}

class FirebaseMessagingServices extends MessagingServices {
  final FirebaseMessaging firebaseInstance;

  FirebaseMessagingServices() : firebaseInstance = FirebaseMessaging.instance;

  @override
  Future<void> initialize() async {
    if (Platform.isIOS) {
      /// Update the iOS foreground notification presentation options to allow
      /// heads up notifications.
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    FirebaseMessaging.onMessage.listen((event) {
      _logger.d("Message received: $event");
      messageReceivedSubject.add(_remoteMessageToNotificationMessage(event));
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      _logger.d("Notification opened: $event");
      notificationClickedSubject
          .add(_remoteMessageToNotificationMessage(event));
    });
  }

  NotificationMessage _remoteMessageToNotificationMessage(
      RemoteMessage remoteMessage) {
    if (remoteMessage == null) {
      return null;
    }
    return NotificationMessage(remoteMessage.data,
        title: remoteMessage.notification.title,
        body: remoteMessage.notification.body);
  }

  @override
  Future<NotificationMessage> getInitialNotification() async {
    return _remoteMessageToNotificationMessage(
        await firebaseInstance.getInitialMessage());
  }

  @override
  Future<void> subscribeTo(List<String> topics) async {
    List<Future<void>> futures = List();
    topics.forEach(
        (topic) => futures.add(firebaseInstance.subscribeToTopic(topic)));
    await Future.wait(futures);
  }

  @override
  Future<void> unsubscribeFrom(List<String> topics) async {
    List<Future<void>> futures = List();
    topics.forEach(
        (topic) => futures.add(firebaseInstance.unsubscribeFromTopic(topic)));
    await Future.wait(futures);
  }
}
