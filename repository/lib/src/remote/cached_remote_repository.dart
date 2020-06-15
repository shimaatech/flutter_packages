import 'package:flutter/foundation.dart';
import 'package:repository/repository.dart';

class CachedRemoteRepository<P extends Persistent<ID>, ID>
    implements Repository<P, ID> {
  @protected
  final RemoteRepository<P, ID> remoteRepository;
  @protected
  final LocalRepository<P, ID> localRepository;

  CachedRemoteRepository(this.remoteRepository, this.localRepository);

  @override
  Future<void> delete(ID id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<P> getById(ID id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<void> save(P persistent) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future<void> saveAll(Iterable<P> persistentList) {
    // TODO: implement saveAll
    throw UnimplementedError();
  }

  @override
  Future<bool> exists(ID id) async {
    return await existLocally(id) || await remoteRepository.exists(id);
  }

  Future<bool> existLocally(ID id) {
    return localRepository.exists(id);
  }
}
