import 'package:dio/dio.dart';
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

  @computed
  List<E> get entitiesList =>
      entitiesListReady ? entitiesListFuture.value : null;

  // it's not good that this depends on DioError... but it's OK for now...
  @computed
  bool get hasConnectionError => hasError && lastError.exception is DioError;

  @action
  void fetchEntity(ID id) {
    observeAndCatchError(
      entityFuture = ObservableFuture(repository.findById(id)),
    );
  }

  @action
  fetchMultipleEntities(List<ID> ids) {
    observeAndCatchError(
      entitiesListFuture = ObservableFuture(repository.findAll(ids)),
    );
  }

  @action
  void fetchEntitiesList({Map<String, dynamic> filter}) {
    observeAndCatchError(
      entitiesListFuture = ObservableFuture(repository.list(filter: filter)),
    );
  }
}
