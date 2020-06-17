import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:repository/src/remote/dio_rest_client.dart';
import 'package:repository/src/remote/remote_repository.dart';
import 'package:serializer/serializer.dart';

import '../../repository.dart';

class DioRemoteRepository<E extends Entity<ID>, ID>
    extends RemoteRepository<E, ID> {
  DioRemoteRepository(this.dio, this.resourceName, Serializer<E> serializer)
      : dioRestClient = DioRestClient(serializer, dio, resourceName),
        super(serializer);

  @protected
  final Dio dio;

  @protected
  final String resourceName;

  @protected
  final DioRestClient<E> dioRestClient;

  @override
  Future<void> delete(ID id) {
    return dioRestClient.delete(id.toString());
  }

  @override
  Future<E> getById(ID id) {
    return dioRestClient.get(id.toString());
  }

  @override
  Future<void> save(E entity) {
    return dioRestClient.post(entity);
  }

  @override
  Future<void> saveAll(Iterable<E> entities) {
    // TODO: implement saveAll
    throw UnimplementedError();
  }

  @override
  Future<bool> exists(ID id) async {
    return (await getById(id)) != null;
  }
}
