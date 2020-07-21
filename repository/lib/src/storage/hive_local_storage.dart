import 'package:hive/hive.dart';

import 'storage.dart';

class HiveLocalStorage implements LocalStorage {
  final Box _box;

  HiveLocalStorage(this._box);

  @override
  T get<T>(String key, [T defaultValue]) {
    return _box.get(key, defaultValue: defaultValue);
  }

  @override
  Future<void> save<T>(String key, T value) {
    return _box.put(key, value);
  }

  @override
  bool exists(String key) {
    return _box.containsKey(key);
  }

  @override
  Future<void> clearAll() {
    return _box.clear();
  }

  @override
  Future<void> remove(String key) {
    return _box.delete(key);
  }
}
