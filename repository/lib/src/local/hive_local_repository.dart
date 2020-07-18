import 'package:hive/hive.dart';

import '../abstract/abstract.dart';
import 'local.dart';

// TODO implement HiveLazyLocalRepository for LazyBox (good when you have repository with many data)

class HiveCachedRepository<E extends Entity<ID>, ID> implements StorageCachedRepository<E, ID>{
  final Box<E> _box;

  HiveCachedRepository(this._box);

  @override
  Future<void> delete(ID id) {
    return _box.delete(id);
  }

  @override
  bool exists(ID id) {
    return _box.containsKey(id);
  }

  @override
  E findById(ID id) {
    return _box.get(id);
  }

  @override
  Iterable<E> findAll(List<ID> ids) {
    List<E> entities = [];
    for (ID id in ids) {
      E foundEntity = findById(id);
      if (foundEntity != null) {
        entities.add(findById(id));
      }
    }
    return entities;
  }

  @override
  Iterable<E> list({Map<String, dynamic> filter}) {
    if (filter != null) {
      throw UnsupportedError('Filtering is not supported');
    }
    return _box.values;
  }

  @override
  Future<void> save(E entity) {
    return _box.put(entity.id, entity);
  }

  @override
  Future<void> saveAll(Iterable<E> entities) {
    return _box
        .putAll(Map.fromIterable(entities, key: (p) => p.id, value: (p) => p));
  }

  @override
  int count() {
    return _box.keys.length;
  }

  @override
  Future<void> deleteAll() {
    return _box.clear();
  }

}


class HiveLocalRepository<E extends Entity<ID>, ID>
    implements LocalRepository<E, ID> {

  // TODO implement and use LazyBox... currently this is a simple implementation

  final Box<E> _box;
  final StorageCachedRepository<E, ID> _cachedRepository;

  HiveLocalRepository(this._box): _cachedRepository = HiveCachedRepository(_box);

  @override
  Future<void> delete(ID id) {
    return _cachedRepository.delete(id);
  }

  @override
  Future<bool> exists(ID id) async {
    return _cachedRepository.exists(id);
  }

  @override
  Future<E> findById(ID id) async {
    return _cachedRepository.findById(id);
  }

  @override
  Future<List<E>> findAll(List<ID> ids) async {
    return _cachedRepository.findAll(ids);
  }

  @override
  Future<List<E>> list({Map<String, dynamic> filter}) async {
    return _cachedRepository.list(filter: filter);
  }

  @override
  Future<void> save(E entity) {
    return _cachedRepository.save(entity);
  }

  @override
  Future<void> saveAll(Iterable<E> entities) async{
    return _cachedRepository.saveAll(entities);
  }

  @override
  Future<int> count() async {
    return _cachedRepository.count();
  }

  @override
  Future<void> deleteAll() {
    return _cachedRepository.deleteAll();
  }
}
