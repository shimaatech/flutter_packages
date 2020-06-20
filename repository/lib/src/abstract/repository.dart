abstract class Entity<ID> {
  ID get id;
}

abstract class Repository<E extends Entity<ID>, ID> {
  Future<bool> exists(ID id);

  Future<E> findById(ID id);

  Future<List<E>> findAll(List<ID> ids);

  Future<void> save(E entity);

  Future<void> saveAll(Iterable<E> entities);

  Future<void> delete(ID id);

  Future<int> count();
}