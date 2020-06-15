import 'package:hive/hive.dart';

import '../abstract/abstract.dart';
import 'local.dart';

class HiveLocalRepository<E extends Entity<ID>, ID>
    implements LocalRepository<E, ID> {

  final LazyBox<E> _box;

  HiveLocalRepository(this._box);

  @override
  Future<void> delete(ID id) {
    return _box.delete(id);
  }

  @override
  Future<bool> exists(ID id) async {
    return _box.containsKey(id);
  }

  @override
  Future<E> getById(ID id) {
    return _box.get(id);
  }

  @override
  Future<void> save(E entity) {
    return _box.put(entity.id, entity);
  }

  @override
  Future<void> saveAll(Iterable<E> entities) {
    return _box.putAll(
        Map.fromIterable(entities, key: (p) => p.getId(), value: (p) => p));
  }
}
