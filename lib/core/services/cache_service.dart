import '../../data/models/cache_entry.dart';
import '../../get_it.dart';
import 'db_service.dart';

/// Service for managing cache operations
class CacheService {
  final _dbService = getIt<DBService>();
  static const String _cacheBox = DBService.cacheBox;

  Future<void> put(String key, dynamic value, {Duration? ttl}) async {
    final entry = CacheEntry(
      key: key,
      value: value,
      timestamp: DateTime.now(),
      ttl: ttl,
    );
    await _dbService.put(_cacheBox, key, entry);
  }

  Future<dynamic> get(String key) async {
    final entry = await _dbService.get<CacheEntry>(_cacheBox, key);
    
    if (entry == null) return null;
    
    // Check if cache is expired
    if (entry.isExpired) {
      await delete(key);
      return null;
    }
    
    return entry.value;
  }

  Future<void> delete(String key) async {
    await _dbService.delete(_cacheBox, key);
  }

  Future<void> clear() async {
    await _dbService.clearBox(_cacheBox);
  }

  Future<bool> has(String key) async {
    final entry = await _dbService.get<CacheEntry>(_cacheBox, key);
    if (entry == null) return false;
    
    if (entry.isExpired) {
      await delete(key);
      return false;
    }
    
    return true;
  }

  Future<void> clearExpired() async {
    final entries = await _dbService.getAll<CacheEntry>(_cacheBox);
    final expiredKeys = entries
        .where((entry) => entry.isExpired)
        .map((entry) => entry.key)
        .toList();
    
    if (expiredKeys.isNotEmpty) {
      await _dbService.deleteAll(_cacheBox, expiredKeys);
    }
  }
}
