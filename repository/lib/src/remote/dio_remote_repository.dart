import 'package:repository/src/remote/remote_repository.dart';

import '../../repository.dart';

class DioRemoteRepository<P extends Persistent<ID>, ID>
    implements RemoteRepository<P, ID> {

  @override
  Future<void> delete(ID id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<P> getById(ID id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<void> save(P persistent) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future<void> saveAll(Iterable<P> persistentList) {
    // TODO: implement saveAll
    throw UnimplementedError();
  }

  @override
  Future<bool> exists(ID id) {
    // TODO: implement exists
    throw UnimplementedError();
  }

}
