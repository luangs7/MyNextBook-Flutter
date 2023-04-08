import 'dart:ffi';

abstract class CloudServiesRemoteConfig {
  Future<Bool> setDefaults(int resourceId);
  Future<Bool> fetch(Long cacheExpiration);
  String getString(String key);
  Bool getBoolean(String key);
}
