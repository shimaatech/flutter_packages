import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

import 'messaging_services.dart';


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
}

class FlutterLocalNotificationsScheduler extends NotificationScheduler {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidNotificationChannelDetails androidNotificationChannel;

  FlutterLocalNotificationsScheduler(
      InitializationSettings initializationSettings,
      this.androidNotificationChannel) {
    notificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (data) async {
      notificationClickedSubject.add(NotificationMessage(jsonDecode(data)));
    });
  }

  @override
  Future<void> showNotification(NotificationMessage notification) {
    _logger.d('Showing notification: $notification');
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        androidNotificationChannel.id,
        androidNotificationChannel.name,
        androidNotificationChannel.description,
        importance: Importance.Max,
        priority: Priority.High);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    return notificationsPlugin.show(0, notification.title, notification.body, platformChannelSpecifics,
        payload: jsonEncode(notification.data));
  }
}

class AndroidNotificationChannelDetails {
  final String id;
  final String name;
  final String description;

  AndroidNotificationChannelDetails(this.id, this.name, this.description);
}
