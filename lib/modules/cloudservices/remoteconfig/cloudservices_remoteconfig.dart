abstract class CloudServicesRemoteConfig {
  Future setDefaults(Map<String, dynamic> params);
  Future fetch(int cacheExpiration);
  String getString(String key);
  bool getBoolean(String key);
}
