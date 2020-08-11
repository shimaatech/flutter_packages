import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notifications/notifications.dart';

import 'messaging_services.dart';

typedef NotificationCallback = Function(NotificationMessage notification);

class NotificationsHandler extends StatefulWidget {
  NotificationsHandler({
    @required this.child,
    this.notificationsServices,
    this.onNotificationClicked,
    this.onNotificationReceived,
    Key key,
  }) : super(key: key);

  final NotificationsServices notificationsServices;
  final NotificationCallback onNotificationReceived;
  final NotificationCallback onNotificationClicked;
  final Widget child;

  @override
  _NotificationsHandlerState createState() => _NotificationsHandlerState();
}

class _NotificationsHandlerState extends State<NotificationsHandler> {
  StreamSubscription<NotificationMessage> _notificationReceivedSubscription;
  StreamSubscription<NotificationMessage> _notificationClickedSubscription;

  @override
  void initState() {
    super.initState();
    _notificationReceivedSubscription = widget
        .notificationsServices.onNotificationReceived
        .listen(widget.onNotificationReceived);

    _notificationClickedSubscription = widget
        .notificationsServices.onNotificationClicked
        .listen(widget.onNotificationClicked);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    super.dispose();
    _notificationClickedSubscription.cancel();
    _notificationReceivedSubscription.cancel();
  }
}
