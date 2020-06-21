import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

part 'base_store.g.dart';

Logger _logger = Logger();

class StoreError {
  final String message;
  final dynamic exception;
  final StackTrace stackTrace;

  StoreError(this.message, [this.exception, this.stackTrace]);

  @override
  String toString() {
    return message + ': ' + exception?.toString() ?? '';
  }
}

class BaseStore = _BaseStore with _$BaseStore;

abstract class _BaseStore with Store {
  _BaseStore() {
    _initialize();
  }

  @observable
  StoreError _lastError;

  @computed
  StoreError get lastError => _lastError;

  @protected
  set lastError(error) => _lastError = error;

  @computed
  bool get hasError => _lastError != null;

  @observable
  bool _initialized = false;

  @computed
  bool get initialized => _initialized;

  @protected
  void _initialize() {
    observeAndCatchError(initialize(), onSuccess: () {
      _initialized = true;
      onInitialized();
    });
  }

  @mustCallSuper
  @protected
  @action
  Future<void> initialize() async {}

  @protected
  void onInitialized() {}

  @protected
  void observeAndCatchError(Future future, {Function onSuccess}) {
    lastError = null;
    future.then((_) => onSuccess != null ? onSuccess() : null,
        onError: (e, stacktrace) {
      _logger.e(
          'An error occurred at "${this.runtimeType}": $e', e, stacktrace);
      lastError = StoreError('An error occurred', e, stacktrace);
    });
  }
}
