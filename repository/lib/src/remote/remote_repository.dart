import 'package:flutter/foundation.dart';
import 'package:serializer/serializer.dart';

import '../../repository.dart';

abstract class RemoteRepository<E extends Entity<ID>, ID>
    extends Repository<E, ID> {
}
