import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:repository/src/remote/remote_repository.dart';
import 'package:serializer/serializer.dart';

import '../../repository.dart';

class DioRemoteRepository<E extends Entity<ID>, ID>
    extends RemoteRepository<E, ID> {
  DioRemoteRepository(this.dio, this.resourceName, Serializer<E> serializer)
      : super(serializer);

  @protected
  final Dio dio;

  @protected
  final String resourceName;

  @override
  Future<void> delete(ID id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<E> getById(ID id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<void> save(E entity) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future<void> saveAll(Iterable<E> entities) {
    // TODO: implement saveAll
    throw UnimplementedError();
  }

  @override
  Future<bool> exists(ID id) {
    // TODO: implement exists
    throw UnimplementedError();
  }
}
