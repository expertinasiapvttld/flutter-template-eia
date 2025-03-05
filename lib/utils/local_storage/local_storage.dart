abstract class LocalStorage {
  Future<bool> setBool(String key, bool value);

  bool getBool(String key);

  Future<bool> setString(String key, String value);

  String getString(String key);

  Future<bool> setInt(String key, int value);

  int getInt(String key);

  Future<bool> setDouble(String key, double value);

  double getDouble(String key);

  Future<bool> remove(String key);

  Future<bool> clear();
}
