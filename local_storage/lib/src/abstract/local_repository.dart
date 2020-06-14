abstract class Persistent<ID> {
  ID get id;
}

abstract class LocalRepository<P extends Persistent<ID>, ID> {
  bool exists(ID id);

  Future<P> getById(ID id);

  Future<void> save(P persistent);

  Future<void> saveAll(Iterable<P> persistentList);

  Future<void> delete(ID id);
}
