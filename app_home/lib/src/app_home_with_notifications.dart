import 'package:app_home/app_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_utils/mobx_utils.dart';
import 'package:notifications/notifications.dart';

abstract class AppHomeWithNotifications extends BaseAppHome {
  final NotificationsStore notificationsStore;

  AppHomeWithNotifications(BaseAppStore appStore, this.notificationsStore)
      : super(appStore);

  @override
  void observe(BuildContext context, Reaction reaction) {
    super.observe(context, reaction);
    if (notificationsStore.receivedNotification != null) {
      onNotificationReceived(context, notificationsStore.receivedNotification);
    }
    if (notificationsStore.clickedNotification != null) {
      onNotificationClicked(context, notificationsStore.clickedNotification);
    }
  }

  void onNotificationReceived(
      BuildContext context, NotificationMessage notification);

  void onNotificationClicked(
      BuildContext context, NotificationMessage notification);
}
