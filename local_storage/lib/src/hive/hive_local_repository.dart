import 'package:hive/hive.dart';
import '../abstract/abstract.dart';

class HiveLocalRepository<P extends Persistent<ID>, ID>
    implements LocalRepository<P, ID> {
  final LazyBox<P> _box;

  HiveLocalRepository(this._box);

  @override
  Future<void> delete(ID id) {
    return _box.delete(id);
  }

  @override
  bool exists(ID id) {
    return _box.containsKey(id);
  }

  @override
  Future<P> getById(ID id) {
    return _box.get(id);
  }

  @override
  Future<void> save(P persistent) {
    return _box.put(persistent.id, persistent);
  }

  @override
  Future<void> saveAll(Iterable<P> persistentList) {
    return _box.putAll(Map.fromIterable(persistentList,
        key: (p) => p.getId(), value: (p) => p));
  }
}
