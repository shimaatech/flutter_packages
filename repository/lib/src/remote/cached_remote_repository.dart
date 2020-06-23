import 'package:flutter/foundation.dart';
import 'package:repository/repository.dart';

class CachedRemoteRepository<E extends Entity<ID>, ID>
    implements Repository<E, ID> {

  CachedRemoteRepository(this.remoteRepository, this.localRepository);

  @protected
  final RemoteRepository<E, ID> remoteRepository;
  @protected
  final LocalRepository<E, ID> localRepository;


  @override
  Future<void> delete(ID id) {
    // TODO what if delete failed in one of the repositories?
    return Future.wait([
      localRepository.delete(id),
      remoteRepository.delete(id),
    ]);
  }

  @override
  Future<E> findById(ID id) async {
    E entity = await localRepository.findById(id);
    if (entity != null) {
      return entity;
    }
    entity = await remoteRepository.findById(id);
    // cache entity locally
    await localRepository.save(entity);
    return entity;
  }

  @override
  Future<void> save(E entity) {
    // TODO what if save failed in one of the repositories?
    return Future.wait([
      localRepository.save(entity),
      remoteRepository.save(entity),
    ]);
  }

  @override
  Future<void> saveAll(Iterable<E> entities) {
    // TODO what if saveAll failed in one of the repositories?
    return Future.wait([
      localRepository.saveAll(entities),
      remoteRepository.saveAll(entities),
    ]);
  }

  @override
  Future<bool> exists(ID id) async {
    return await existLocally(id) || await remoteRepository.exists(id);
  }

  /// returns true if the entity exists in the local repository
  Future<bool> existLocally(ID id) {
    return localRepository.exists(id);
  }

  /// refreshes the local repository with current data from the remote repo
  Future<void> refresh(ID id, {invalidateOnNonExist = true}) async {
    E remoteEntity = await remoteRepository.findById(id);
    if (remoteEntity != null) {
      return localRepository.save(remoteEntity);
    } else if (invalidateOnNonExist) {
      return localRepository.delete(id);
    }
  }

  @override
  Future<int> count() {
    // return remote count always...
    return remoteRepository.count();
  }

  @override
  Future<List<E>> findAll(List<ID> ids) {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  Future<List<E>> list(Map<String, dynamic> filter) {
    // always list from remote repository... (maybe unless the filter hasn't changed?)
    return remoteRepository.list(filter);
  }
}
