import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:repository/src/remote/dio_rest_client.dart';
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

  @protected
  String get baseUrl => '${dio.options.baseUrl}/$resourceName';

  @protected
  DioRestClient<E> get dioRestClient => DioRestClient(serializer, dio, baseUrl);

  @override
  Future<void> delete(ID id) {
    return dioRestClient.delete(id.toString());
  }

  @override
  Future<E> findById(ID id) {
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
    return (await findById(id)) != null;
  }

  @override
  Future<int> count() {
    return dioRestClient.count();
  }

  @override
  Future<List<E>> findAll(List<ID> ids) {
    return dioRestClient.getMultiple(ids.map((e) => e.toString()).toList());
  }

  @override
  Future<List<E>> list({Map<String, dynamic>? filter}) {
    return dioRestClient.list(filter);
  }

  @override
  Future<void> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }
}
