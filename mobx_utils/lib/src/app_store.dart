import 'package:mobx/mobx.dart';
import 'package:mobx_utils/mobx_utils.dart';

part 'app_store.g.dart';


class AppStore = _AppStore with _$AppStore;

abstract class _AppStore extends BaseStore with Store {

}