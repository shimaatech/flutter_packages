import 'package:repository/repository.dart';

import '../abstract/repository.dart';

abstract class LocalRepository<E extends Entity<ID>, ID>
    extends Repository<E, ID> {}
