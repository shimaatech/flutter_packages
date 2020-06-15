import '../../repository.dart';

abstract class RemoteRepository<P extends Persistent<ID>, ID>
    extends Repository<P, ID> {
}
