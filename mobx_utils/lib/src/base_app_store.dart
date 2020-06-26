import 'package:mobx/mobx.dart';
import 'package:mobx_utils/mobx_utils.dart';

part 'base_app_store.g.dart';


class BaseAppStore = _BaseAppStore with _$BaseAppStore;

abstract class _BaseAppStore extends BaseStore with Store {

}