import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_utils/src/notifications_store.dart';
import 'package:notifications/src/notifications.dart';

import '../mobx_utils.dart';

part 'app_with_notifications_store.g.dart';


class AppWithNotificationsStore = _AppWithNotificationsStore with _$AppWithNotificationsStore;

abstract class _AppWithNotificationsStore extends BaseStore with Store {

  @protected
  final NotificationsStore notificationsStore;

  _AppWithNotificationsStore(this.notificationsStore);

  NotificationMessage get clickedNotification

}