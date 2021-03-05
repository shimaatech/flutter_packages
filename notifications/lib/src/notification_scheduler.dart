import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

import 'messaging_services.dart';

// TODO all this is not needed by the new firebase... refactor
// check https://pub.dev/packages/firebase_messaging/versions/8.0.0-dev.10/example
// you can use flutter local notifications to show the notification directly
// in onMessage

Logger _logger = Logger();

abstract class NotificationScheduler {
  @protected
  final BehaviorSubject<NotificationMessage> notificationClickedSubject =
      BehaviorSubject();

  Stream<NotificationMessage> get onNotificationClicked =>
      notificationClickedSubject.stream;

  Future<void> showNotification(NotificationMessage notification);

  Future<void> dispose() async {
    notificationClickedSubject.close();
  }

  Future<void> initialize();
}

class AndroidNotificationChannel {
  const AndroidNotificationChannel(this.id, this.name, this.description);

  final String id;
  final String name;
  final String description;
}

class FlutterLocalNotificationsScheduler extends NotificationScheduler {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidNotificationChannel androidNotificationChannel;

  @override
  Future<void> initialize() async {
    await notificationsPlugin.initialize(InitializationSettings(
        AndroidInitializationSettings('ic_launcher'),
        IOSInitializationSettings()));
  }

  FlutterLocalNotificationsScheduler(
      InitializationSettings initializationSettings,
      this.androidNotificationChannel) {
    notificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (encodedNotification) async {
      // TODO add fromJson toJson to the NotificationMessage instead of doing
      //  this manually here
      Map<String, dynamic> notificationData = jsonDecode(encodedNotification);
      notificationClickedSubject.add(NotificationMessage(
          notificationData['data'],
          title: notificationData['title'],
          body: notificationData['body']));
    });
  }

  @override
  Future<void> showNotification(NotificationMessage notification) {
    _logger.d('Showing notification: $notification');
    // TODO add fromJson toJson to the NotificationMessage instead of doing this
    // manually here
    Map<String, dynamic> notificationData = Map();
    notificationData['data'] = notification.data;
    notificationData['title'] = notification.title;
    notificationData['body'] = notification.body;
    return notificationsPlugin.show(
        0,
        notification.title,
        notification.body,
        NotificationDetails(
          AndroidNotificationDetails(
            androidNotificationChannel.id,
            androidNotificationChannel.name,
            androidNotificationChannel.description,
            importance: Importance.Max,
            priority: Priority.Max,
          ),
          IOSNotificationDetails(),
        ),
        payload: jsonEncode(notificationData));
  }
}

class AndroidNotificationChannelDetails {
  final String id;
  final String name;
  final String description;

  AndroidNotificationChannelDetails(this.id, this.name, this.description);
}
