import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_utils/mobx_utils.dart';
import 'package:notifications/notifications.dart';

part 'notifications_store.g.dart';

class NotificationsStore = _NotificationsStore with _$NotificationsStore;

abstract class _NotificationsStore extends BaseStore with Store {
  @protected
  final NotificationsServices notificationsServices;

  StreamSubscription<NotificationMessage> _notificationReceivedSubscription;
  StreamSubscription<NotificationMessage> _notificationClickedSubscription;

  @observable
  NotificationMessage _clickedNotification;

  NotificationMessage get clickedNotification => _clickedNotification;

  @observable
  NotificationMessage _receivedNotification;

  NotificationMessage get receivedNotification => _receivedNotification;

  _NotificationsStore(this.notificationsServices) {
    _notificationReceivedSubscription = notificationsServices
        .onNotificationReceived
        .listen(_onNotificationClicked);

    _notificationClickedSubscription = notificationsServices
        .onNotificationClicked
        .listen(_onNotificationReceived);
  }

  @action
  void _onNotificationClicked(NotificationMessage notification) {
    _clickedNotification = notification;
  }

  @action
  void _onNotificationReceived(NotificationMessage notification) {
    _receivedNotification = notification;
  }

  @override
  void dispose() {
    super.dispose();
    _notificationClickedSubscription.cancel();
    _notificationReceivedSubscription.cancel();
  }
}
