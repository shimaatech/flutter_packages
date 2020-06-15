abstract class Persistent<ID> {
  ID get id;
}

abstract class Repository<P extends Persistent<ID>, ID> {
  Future<bool> exists(ID id);

  Future<P> getById(ID id);

  Future<void> save(P persistent);

  Future<void> saveAll(Iterable<P> persistentList);

  Future<void> delete(ID id);
}