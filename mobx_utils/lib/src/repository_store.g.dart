// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RepositoryStore<R extends Repository<E, ID>, E extends Entity<ID>, ID>
    on _RepositoryStore<R, E, ID>, Store {
  Computed<bool> _$entityReadyComputed;

  @override
  bool get entityReady =>
      (_$entityReadyComputed ??= Computed<bool>(() => super.entityReady,
              name: '_RepositoryStore.entityReady'))
          .value;
  Computed<bool> _$entitiesListReadyComputed;

  @override
  bool get entitiesListReady => (_$entitiesListReadyComputed ??= Computed<bool>(
          () => super.entitiesListReady,
          name: '_RepositoryStore.entitiesListReady'))
      .value;
  Computed<E> _$entityComputed;

  @override
  E get entity => (_$entityComputed ??=
          Computed<E>(() => super.entity, name: '_RepositoryStore.entity'))
      .value;

  final _$entityFutureAtom = Atom(name: '_RepositoryStore.entityFuture');

  @override
  ObservableFuture<E> get entityFuture {
    _$entityFutureAtom.reportRead();
    return super.entityFuture;
  }

  @override
  set entityFuture(ObservableFuture<E> value) {
    _$entityFutureAtom.reportWrite(value, super.entityFuture, () {
      super.entityFuture = value;
    });
  }

  final _$entitiesListFutureAtom =
      Atom(name: '_RepositoryStore.entitiesListFuture');

  @override
  ObservableFuture<List<E>> get entitiesListFuture {
    _$entitiesListFutureAtom.reportRead();
    return super.entitiesListFuture;
  }

  @override
  set entitiesListFuture(ObservableFuture<List<E>> value) {
    _$entitiesListFutureAtom.reportWrite(value, super.entitiesListFuture, () {
      super.entitiesListFuture = value;
    });
  }

  final _$_RepositoryStoreActionController =
      ActionController(name: '_RepositoryStore');

  @override
  void fetchEntity(ID id) {
    final _$actionInfo = _$_RepositoryStoreActionController.startAction(
        name: '_RepositoryStore.fetchEntity');
    try {
      return super.fetchEntity(id);
    } finally {
      _$_RepositoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchMultipleEntities(List<ID> ids) {
    final _$actionInfo = _$_RepositoryStoreActionController.startAction(
        name: '_RepositoryStore.fetchMultipleEntities');
    try {
      return super.fetchMultipleEntities(ids);
    } finally {
      _$_RepositoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchEntitiesList({Map<String, dynamic> filter}) {
    final _$actionInfo = _$_RepositoryStoreActionController.startAction(
        name: '_RepositoryStore.fetchEntitiesList');
    try {
      return super.fetchEntitiesList(filter: filter);
    } finally {
      _$_RepositoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
entityFuture: ${entityFuture},
entitiesListFuture: ${entitiesListFuture},
entityReady: ${entityReady},
entitiesListReady: ${entitiesListReady},
entity: ${entity}
    ''';
  }
}
