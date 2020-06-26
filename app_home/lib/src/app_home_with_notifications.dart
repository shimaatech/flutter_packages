import 'package:app_home/app_home.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_utils/mobx_utils.dart';

abstract class AppHomeWithNotifications extends BaseAppHome {
  final NotificationsStore notificationsStore;

  AppHomeWithNotifications(BaseAppStore appStore, this.notificationsStore)
      : super(appStore);

  @override
  void observe(Reaction reaction) {
    super.observe(reaction);
    if (notificationsStore.receivedNotification != null) {
      onNotificationReceived(notificationsStore.receivedNotification.data);
    }
    if (notificationsStore.clickedNotification != null) {
      onNotificationClicked(notificationsStore.clickedNotification.data);
    }
  }

  void onNotificationReceived(Map data);

  void onNotificationClicked(Map data);
}
