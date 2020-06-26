// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NotificationsStore on _NotificationsStore, Store {
  Computed<NotificationMessage> _$clickedNotificationComputed;

  @override
  NotificationMessage get clickedNotification =>
      (_$clickedNotificationComputed ??= Computed<NotificationMessage>(
              () => super.clickedNotification,
              name: '_NotificationsStore.clickedNotification'))
          .value;
  Computed<NotificationMessage> _$receivedNotificationComputed;

  @override
  NotificationMessage get receivedNotification =>
      (_$receivedNotificationComputed ??= Computed<NotificationMessage>(
              () => super.receivedNotification,
              name: '_NotificationsStore.receivedNotification'))
          .value;

  final _$_clickedNotificationAtom =
      Atom(name: '_NotificationsStore._clickedNotification');

  @override
  NotificationMessage get _clickedNotification {
    _$_clickedNotificationAtom.reportRead();
    return super._clickedNotification;
  }

  @override
  set _clickedNotification(NotificationMessage value) {
    _$_clickedNotificationAtom.reportWrite(value, super._clickedNotification,
        () {
      super._clickedNotification = value;
    });
  }

  final _$_receivedNotificationAtom =
      Atom(name: '_NotificationsStore._receivedNotification');

  @override
  NotificationMessage get _receivedNotification {
    _$_receivedNotificationAtom.reportRead();
    return super._receivedNotification;
  }

  @override
  set _receivedNotification(NotificationMessage value) {
    _$_receivedNotificationAtom.reportWrite(value, super._receivedNotification,
        () {
      super._receivedNotification = value;
    });
  }

  final _$_NotificationsStoreActionController =
      ActionController(name: '_NotificationsStore');

  @override
  void _onNotificationClicked(NotificationMessage notification) {
    final _$actionInfo = _$_NotificationsStoreActionController.startAction(
        name: '_NotificationsStore._onNotificationClicked');
    try {
      return super._onNotificationClicked(notification);
    } finally {
      _$_NotificationsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _onNotificationReceived(NotificationMessage notification) {
    final _$actionInfo = _$_NotificationsStoreActionController.startAction(
        name: '_NotificationsStore._onNotificationReceived');
    try {
      return super._onNotificationReceived(notification);
    } finally {
      _$_NotificationsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
clickedNotification: ${clickedNotification},
receivedNotification: ${receivedNotification}
    ''';
  }
}
