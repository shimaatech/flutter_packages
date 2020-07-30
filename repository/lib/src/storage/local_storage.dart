abstract class LocalStorage {

  T get<T>(String key, [T defaultValue]);

  Future<void> save<T>(String key, T value);

  List<T> getList<T>(String key, [List<T> defaultValue]);

  Future<void> saveList<T>(String key, List<T> value);

  Future<void> remove(String key);

  bool exists(String key);

  Future<void> clearAll();
}
