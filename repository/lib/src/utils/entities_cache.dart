import 'package:repository/repository.dart';

class EntitiesCache<E extends Entity<ID>, ID> {
  final Map<ID, E> _cache;

  EntitiesCache(List<E> entities)
      : _cache = Map.fromIterable(entities, key: (e) => e.id, value: (e) => e);

  E get(ID id) => _cache[id];

  bool exists(ID id) => _cache.containsKey(id);

  Iterable<E> get values => _cache.values;
}
