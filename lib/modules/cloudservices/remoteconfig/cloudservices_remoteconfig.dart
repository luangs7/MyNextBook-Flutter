import 'dart:ffi';

abstract class CloudServicesRemoteConfig {
  Future setDefaults(Map<String, dynamic> params);
  Future fetch(Long cacheExpiration);
  String getString(String key);
  bool getBoolean(String key);
}
