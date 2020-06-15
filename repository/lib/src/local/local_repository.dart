import 'package:repository/repository.dart';

import '../abstract/repository.dart';

abstract class LocalRepository<P extends Persistent<ID>, ID>
    extends Repository<P, ID> {}
