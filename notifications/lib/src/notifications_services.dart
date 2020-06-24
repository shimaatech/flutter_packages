import 'dart:async';

import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

import 'messaging_services.dart';
import 'notification_scheduler.dart';

final Logger _logger = Logger();

class NotificationsServices {
  static const scheduledNotificationKey = '__SCHEDULED_NOTIFICATION__';

  final MessagingServices _messagingServices;
  final NotificationScheduler _notificationScheduler;

  StreamSubscription<NotificationMessage> _scheduledNotificationSubscription;

  NotificationsServices(this._messagingServices,
      [this._notificationScheduler]) {

    _messagingServices.onMessageReceived.listen(_onNotificationReceived);

    _messagingServices.onNotificationClicked.listen(_onNotificationClicked);

    if (_notificationScheduler != null) {
      _scheduledNotificationSubscription = _notificationScheduler
          .onNotificationClicked
          .listen(_handleScheduledNotification);
    }

  }

  final BehaviorSubject<NotificationMessage> _notificationReceivedSubject =
      BehaviorSubject();

  Stream<NotificationMessage> get onNotificationReceived =>
      _notificationReceivedSubject.stream;

  final BehaviorSubject<NotificationMessage> _notificationClickedSubject =
      BehaviorSubject();

  Stream<NotificationMessage> get onNotificationClicked =>
      _notificationClickedSubject.stream;


  void _handleScheduledNotification(NotificationMessage notification) {
    // handle only notifications that were scheduled using this service
    if (notification.data.containsKey(scheduledNotificationKey)) {
      notification.data.remove(scheduledNotificationKey);
      _onNotificationClicked(notification);
    }
  }

  Future<void> _onNotificationReceived(NotificationMessage notification) async {

    _logger.d('Notification received...');
    if (notification.data == null) {
      return;
    }

    _notificationReceivedSubject.add(notification);
    if (_notificationScheduler != null) {
      // mark that the notification was scheduled using this service
      notification.data[scheduledNotificationKey] = true;
      await _notificationScheduler.showNotification(notification);
    }
  }

  Future<void> _onNotificationClicked(NotificationMessage notification) async {
    _notificationClickedSubject.add(notification);
  }

  Future<void> dispose() async {
    if (_scheduledNotificationSubscription != null) {
      _scheduledNotificationSubscription.cancel();
    }
    _notificationClickedSubject.close();
    _notificationReceivedSubject.close();
  }
}
