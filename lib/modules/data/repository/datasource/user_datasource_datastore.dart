abstract class UserDataSourceDatastore {
  Future updateEmail(String email);
  Future<String> loadPreferences();

  static const String userKey = "userkey";
}
