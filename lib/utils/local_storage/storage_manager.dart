import 'package:happy_grocers/datamodels/user.dart';
import 'package:happy_grocers/utils/local_storage/local_storage.dart';
import 'package:happy_grocers/utils/local_storage/local_storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageManager extends LocalStorage {
  static StorageManager instance = StorageManager();

  static late final SharedPreferences _prefs;
  static Future<SharedPreferences> init(SharedPreferences sp) async {
    _prefs = sp;
    return _prefs;
  }

  static StorageManager getInstance() {
    return instance;
  }

  setUserSession(String userData) async {
    _prefs.setString(LocalStorageKeys.prefUserData, userData);
  }

  User? getLoginUser() {
    String? data = _prefs.getString(LocalStorageKeys.prefUserData);
    if (data == null || data.isEmpty || data == "null") {
      return null;
    } else {
      User userData = userDataFromJson(data);
      return userData;
    }
  }

  @override
  Future<bool> clear() async {
    return await _prefs.clear();
  }

  @override
  bool getBool(String key, {bool defaultValue = false}) {
    return _prefs.getBool(key) ?? defaultValue;
  }

  @override
  double getDouble(String key, {double defaultValue = 0}) {
    return _prefs.getDouble(key) ?? defaultValue;
  }

  @override
  int getInt(String key, {int defaultValue = 0}) {
    return _prefs.getInt(key) ?? defaultValue;
  }

  @override
  String getString(String key, {String? defaultValue}) {
    return _prefs.getString(key) ?? defaultValue ?? '';
  }

  @override
  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  @override
  Future<bool> setDouble(String key, double value) async {
    return await _prefs.setDouble(key, value);
  }

  @override
  Future<bool> setInt(String key, int value) async {
    return await _prefs.setInt(key, value);
  }

  @override
  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }
}
