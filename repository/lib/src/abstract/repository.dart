abstract class Entity<ID> {
  ID get id;
}

abstract class Repository<E extends Entity<ID>, ID> {
  Future<bool> exists(ID id);

  Future<E> findById(ID id);

  Future<List<E>> findAll(List<ID> ids);

  Future<List<E>> list({Map<String, dynamic> filter});

  Future<void> save(E entity);

  Future<void> saveAll(Iterable<E> entities);

  Future<void> delete(ID id);

  Future<void> deleteAll();

  Future<int> count();

}

abstract class StorageCachedRepository<E extends Entity<ID>, ID> {
  bool exists(ID id);

  E findById(ID id);

  Iterable<E> findAll(List<ID> ids);

  Iterable<E> list({Map<String, dynamic> filter});

  Future<void> save(E entity);

  Future<void> saveAll(Iterable<E> entities);

  Future<void> delete(ID id);

  Future<void> deleteAll();

  int count();
}