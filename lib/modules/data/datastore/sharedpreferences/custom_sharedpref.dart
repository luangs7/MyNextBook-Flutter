import 'package:shared_preferences/shared_preferences.dart';

abstract class CustomSharedPref {
  Future<bool> setValue<T>(String key, T data);
  Future<String?> getValue(String key);
}

class CustomSharedPrefImpl extends CustomSharedPref {
  @override
  Future<bool> setValue<T>(String key, T data) async {
    var sharedPref = await SharedPreferences.getInstance();
    return sharedPref.setString(key, data.toString());
  }

  @override
  Future<String?> getValue(String key) async {
    var sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString(key);
  }
}
