// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BaseStore on _BaseStore, Store {
  Computed<StoreError> _$lastErrorComputed;

  @override
  StoreError get lastError =>
      (_$lastErrorComputed ??= Computed<StoreError>(() => super.lastError,
              name: '_BaseStore.lastError'))
          .value;
  Computed<bool> _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??=
          Computed<bool>(() => super.hasError, name: '_BaseStore.hasError'))
      .value;
  Computed<bool> _$initializedComputed;

  @override
  bool get initialized =>
      (_$initializedComputed ??= Computed<bool>(() => super.initialized,
              name: '_BaseStore.initialized'))
          .value;

  final _$_lastErrorAtom = Atom(name: '_BaseStore._lastError');

  @override
  StoreError get _lastError {
    _$_lastErrorAtom.reportRead();
    return super._lastError;
  }

  @override
  set _lastError(StoreError value) {
    _$_lastErrorAtom.reportWrite(value, super._lastError, () {
      super._lastError = value;
    });
  }

  final _$_initializedAtom = Atom(name: '_BaseStore._initialized');

  @override
  bool get _initialized {
    _$_initializedAtom.reportRead();
    return super._initialized;
  }

  @override
  set _initialized(bool value) {
    _$_initializedAtom.reportWrite(value, super._initialized, () {
      super._initialized = value;
    });
  }

  final _$initializeAsyncAction = AsyncAction('_BaseStore.initialize');

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  @override
  String toString() {
    return '''
lastError: ${lastError},
hasError: ${hasError},
initialized: ${initialized}
    ''';
  }
}
