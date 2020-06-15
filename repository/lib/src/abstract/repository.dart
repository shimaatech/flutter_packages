abstract class Entity<ID> {
  ID get id;
}

abstract class Repository<E extends Entity<ID>, ID> {
  Future<bool> exists(ID id);

  Future<E> getById(ID id);

  Future<void> save(E entity);

  Future<void> saveAll(Iterable<E> entities);

  Future<void> delete(ID id);
}