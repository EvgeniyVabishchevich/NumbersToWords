import 'dart:core';

class MapSupport {
  static Map<K, V> mapOf<K, V>(List<MapEntry<K, V>> entries) {
    return Map.fromEntries(entries);
  }

  static Map<K, V> unmodifiableMapOf<K, V>(List<MapEntry<K, V>> entries) {
    return Map.unmodifiable(mapOf(entries));
  }
}
