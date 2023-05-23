import 'dart:collection';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:mynextbook/modules/cloudservices/analytics/cloudservices_analytics.dart';

class FirebaseCloudServicesAnalytics extends CloudServicesAnalytics {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  FirebaseCloudServicesAnalytics();

  @override
  Future onEvent(String event, HashMap<String, Object> params) async {
    await analytics.logEvent(name: event, parameters: params);
  }

  @override
  Future setUserId(String id) async {
    await analytics.setUserId(id: id);
  }

  @override
  Future setUserProperty(String event, String param) async {
    await analytics.setUserProperty(name: event, value: param);
  }
}
