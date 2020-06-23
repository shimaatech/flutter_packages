import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_utils/mobx_utils.dart';
import 'package:repository/repository.dart';

part 'repository_store.g.dart';

class RepositoryStore<R extends Repository<E, ID>, E extends Entity<ID>,
    ID> = _RepositoryStore<R, E, ID> with _$RepositoryStore;

abstract class _RepositoryStore<R extends Repository<E, ID>,
    E extends Entity<ID>, ID> extends BaseStore with Store {
  final R repository;

  _RepositoryStore(this.repository);

  @protected
  @observable
  ObservableFuture<E> entityFuture;

  @protected
  @observable
  ObservableFuture<List<E>> entitiesListFuture;

  @computed
  bool get entityReady =>
      entityFuture != null && entityFuture.status == FutureStatus.fulfilled;

  @computed
  bool get entitiesListReady =>
      entitiesListFuture != null &&
      entitiesListFuture.status == FutureStatus.fulfilled;

  @computed
  E get entity => entityReady ? entityFuture.value : null;

  List<E> get entitiesList =>
      entitiesListReady ? entitiesListFuture.value : null;

  @action
  void fetchEntity(ID id) {
    observeAndCatchError(doFetchEntity(id));
  }

  @action fetchMultipleEntities(List<ID> ids) {
    observeAndCatchError(doFetchMultipleEntities(ids));
  }

  @action
  void fetchEntitiesList({Map<String, dynamic> filter}) {
    observeAndCatchError(doFetchEntitiesList(filter: filter));
  }

  @protected
  Future<void> doFetchEntity(ID id) async {
    entityFuture = ObservableFuture(repository.findById(id));
    await entityFuture;
  }

  @protected
  Future<void> doFetchEntitiesList({Map<String, dynamic> filter}) async {
    entitiesListFuture = ObservableFuture(repository.list(filter));
    await entitiesListFuture;
  }

  @protected
  Future<void> doFetchMultipleEntities(List<ID> ids) async {
    entitiesListFuture = ObservableFuture(repository.findAll(ids));
    await entitiesListFuture;
  }

}
