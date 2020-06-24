import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

Logger _logger = Logger();

class NotificationMessage {
  final Map data;
  final String title;
  final String body;
  final bool isLaunchNotification;

  NotificationMessage(this.data,
      {this.title, this.body, this.isLaunchNotification = false});

  @override
  String toString() {
    return jsonEncode({'title': title, 'body': body, 'data': data});
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
}

class FirebaseMessagingServices extends MessagingServices {
  FirebaseMessaging firebaseInstance;

  FirebaseMessagingServices(this.firebaseInstance) {
    _configure();
  }

  void _configure() {
    firebaseInstance.configure(
        onMessage: _onMessage,
        onLaunch: _onLaunchNotification,
        onResume: _onNotification);
  }

  Future<void> _onMessage(Map<String, dynamic> message) async {
    _logger.d("Message received: $message");
    Map notificationInfo = message['notification'] ?? const {};
    messageReceivedSubject.add(NotificationMessage(message['data'],
        title: notificationInfo['title'], body: notificationInfo['body']));
  }

  Future<void> _onNotification(Map<String, dynamic> message) =>
      _onNotificationClicked(message);

  Future _onLaunchNotification(Map<String, dynamic> message) =>
      _onNotificationClicked(message, true);

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

  Future<void> _onNotificationClicked(Map<String, dynamic> message,
      [isLaunch = false]) async {
    _logger.d("Notification clicked: $message");
    notificationClickedSubject.add(
        NotificationMessage(message['data'], isLaunchNotification: isLaunch));
  }
}
