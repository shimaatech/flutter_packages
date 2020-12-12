import 'dart:async';

import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:notifications/notifications.dart';
import 'package:website_viewer/website_viewer.dart';

import 'messaging_services.dart';

typedef NotificationCallback = Function(NotificationMessage notification);

class NotificationsHandler extends StatefulWidget {
  NotificationsHandler({
    @required this.child,
    this.notificationsServices,
    this.onNotificationClicked,
    this.onNotificationReceived,
    this.enableAutoHandling=true,
    Key key,
  }) : super(key: key);

  final NotificationsServices notificationsServices;
  final NotificationCallback onNotificationReceived;
  final NotificationCallback onNotificationClicked;
  final Widget child;
  final bool enableAutoHandling;

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
        .listen(_onNotificationReceived);

    _notificationClickedSubscription = widget
        .notificationsServices.onNotificationClicked
        .listen(_onNotificationClicked);
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

  void _onNotificationReceived(NotificationMessage notification) {
    widget.onNotificationReceived(notification);
  }


  void _onNotificationClicked(NotificationMessage notification) {
    if (!widget.enableAutoHandling) {
      widget.onNotificationClicked(notification);
    }
    if (notification.type == NotificationType.system &&
        notification.data['url'] != null) {
      WebsiteViewerDialog.show(context, notification.data['url']);
    } else if (notification.type == NotificationType.upgrade) {
      LaunchReview.launch();
    } else {
      widget.onNotificationClicked(notification);
    }
  }

}
