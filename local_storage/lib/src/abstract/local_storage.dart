abstract class LocalStorage {

  T get<T>(String key, [T defaultValue]);

  Future<void> save<T>(String key, T value);

}
