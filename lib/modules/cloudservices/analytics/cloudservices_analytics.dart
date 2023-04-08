import 'dart:collection';

abstract class CloudServicesAnalytics {
  Future onEvent(String event, HashMap<String, Object> params);
  Future setUserProperty(String event, Object param);
  Future setUserId(String id);
}
