import 'package:shared_preferences/shared_preferences.dart';

/// Service for persistent key-value storage using SharedPreferences
class StorageService {
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // String operations
  Future<bool> setString(String key, String value) async => _prefs.setString(key, value);

  String? getString(String key) => _prefs.getString(key);

  // Int operations
  Future<bool> setInt(String key, int value) async => _prefs.setInt(key, value);

  int? getInt(String key) => _prefs.getInt(key);

  // Bool operations
  Future<bool> setBool(String key, bool value) async => _prefs.setBool(key, value);

  bool? getBool(String key) => _prefs.getBool(key);

  // Double operations
  Future<bool> setDouble(String key, double value) async => _prefs.setDouble(key, value);

  double? getDouble(String key) => _prefs.getDouble(key);

  // StringList operations
  Future<bool> setStringList(String key, List<String> value) async => _prefs.setStringList(key, value);

  List<String>? getStringList(String key) => _prefs.getStringList(key);

  // Remove and clear operations
  Future<bool> remove(String key) async => _prefs.remove(key);

  Future<bool> clear() async => _prefs.clear();

  bool containsKey(String key) => _prefs.containsKey(key);

  Set<String> getKeys() => _prefs.getKeys();
}
