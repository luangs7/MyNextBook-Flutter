import 'dart:ffi';

import 'package:mynextbook/modules/cloudservices/remoteconfig/cloudservices_remoteconfig.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseCloudServicesRemoteConfig extends CloudServicesRemoteConfig {
  final remoteConfig = FirebaseRemoteConfig.instance;

  @override
  Future fetch(Long cacheExpiration) async {
    return await remoteConfig.fetch();
  }

  @override
  bool getBoolean(String key) {
    return remoteConfig.getBool(key);
  }

  @override
  String getString(String key) {
    return remoteConfig.getString(key);
  }

  @override
  Future setDefaults(Map<String, dynamic> params) async {
    return await remoteConfig.setDefaults(params);
  }
}
