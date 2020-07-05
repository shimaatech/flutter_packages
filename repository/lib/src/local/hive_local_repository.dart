import 'package:hive/hive.dart';

import '../abstract/abstract.dart';
import 'local.dart';

class HiveLocalRepository<E extends Entity<ID>, ID>
    implements LocalRepository<E, ID> {

  final Box<E> _box;

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
  Future<E> findById(ID id) async {
    return _box.get(id);
  }

  @override
  Future<List<E>> findAll(List<ID> ids) async {
    List<E> entities = [];
    for (ID id in ids) {
      E foundEntity = await findById(id);
      if (foundEntity != null) {
        entities.add(await findById(id));
      }
    }
    return entities;
  }

  @override
  Future<List<E>> list({Map<String, dynamic> filter}) async {
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
    return _box.putAll(
        Map.fromIterable(entities, key: (p) => p.getId(), value: (p) => p));
  }

  @override
  Future<int> count() async {
    return _box.keys.length;
  }

  @override
  Future<void> deleteAll() {
    return _box.clear();
  }
}
