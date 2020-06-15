import '../../repository.dart';

abstract class RemoteRepository<E extends Entity<ID>, ID>
    extends Repository<E, ID> {
}
