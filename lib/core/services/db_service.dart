import 'package:hive_flutter/hive_flutter.dart';

/// Service for managing Hive database operations
class DBService {
  // Box names
  static const String userBox = 'user_box';
  static const String contentBox = 'content_box';
  static const String settingsBox = 'settings_box';
  static const String cacheBox = 'cache_box';

  Future<void> init() async {
    // Register Hive adapters here
    // Hive.registerAdapter(UserModelAdapter());
    // Hive.registerAdapter(ContentItemAdapter());
    // Hive.registerAdapter(SettingsModelAdapter());
  }

  Future<Box<T>> openBox<T>(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<T>(boxName);
    }
    return await Hive.openBox<T>(boxName);
  }

  Future<void> closeBox(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      await Hive.box(boxName).close();
    }
  }

  Future<void> deleteBox(String boxName) async {
    await Hive.deleteBoxFromDisk(boxName);
  }

  Future<void> clearBox(String boxName) async {
    final box = await openBox(boxName);
    await box.clear();
  }

  // Generic CRUD operations
  Future<void> put<T>(String boxName, dynamic key, T value) async {
    final box = await openBox<T>(boxName);
    await box.put(key, value);
  }

  Future<T?> get<T>(String boxName, dynamic key) async {
    final box = await openBox<T>(boxName);
    return box.get(key);
  }

  Future<void> delete(String boxName, dynamic key) async {
    final box = await openBox(boxName);
    await box.delete(key);
  }

  Future<List<T>> getAll<T>(String boxName) async {
    final box = await openBox<T>(boxName);
    return box.values.toList();
  }

  Future<void> putAll<T>(String boxName, Map<dynamic, T> entries) async {
    final box = await openBox<T>(boxName);
    await box.putAll(entries);
  }

  Future<void> deleteAll(String boxName, Iterable<dynamic> keys) async {
    final box = await openBox(boxName);
    await box.deleteAll(keys);
  }

  Future<bool> containsKey(String boxName, dynamic key) async {
    final box = await openBox(boxName);
    return box.containsKey(key);
  }

  Future<int> count(String boxName) async {
    final box = await openBox(boxName);
    return box.length;
  }
}
