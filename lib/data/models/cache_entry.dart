/// Cache entry model for caching data with TTL
class CacheEntry {

  CacheEntry({
    required this.key,
    required this.value,
    required this.timestamp,
    this.ttl,
  });

  factory CacheEntry.fromJson(Map<String, dynamic> json) => CacheEntry(
        key: json['key'] as String,
        value: json['value'],
        timestamp: DateTime.parse(json['timestamp'] as String),
        ttl: json['ttl'] != null
            ? Duration(milliseconds: json['ttl'] as int)
            : null,
      );
  final String key;
  final dynamic value;
  final DateTime timestamp;
  final Duration? ttl;

  bool get isExpired {
    if (ttl == null) return false;
    return DateTime.now().difference(timestamp) > ttl!;
  }

  Map<String, dynamic> toJson() => {
        'key': key,
        'value': value,
        'timestamp': timestamp.toIso8601String(),
        'ttl': ttl?.inMilliseconds,
      };

  @override
  String toString() => 'CacheEntry(key: $key, value: $value, timestamp: $timestamp, ttl: $ttl)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CacheEntry &&
          runtimeType == other.runtimeType &&
          key == other.key &&
          value == other.value &&
          timestamp == other.timestamp &&
          ttl == other.ttl;

  @override
  int get hashCode => Object.hash(key, value, timestamp, ttl);
}
