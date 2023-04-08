import 'package:mynextbook/modules/data/datastore/sharedpreferences/custom_sharedpref.dart';
import 'package:mynextbook/modules/data/repository/datasource/user_datasource_datastore.dart';

class UserDatastoreImpl extends UserDataSourceDatastore {
  final CustomSharedPref sharedPreferences;

  UserDatastoreImpl(this.sharedPreferences);

  @override
  Future<String> loadPreferences() async {
    return await sharedPreferences.getValue(UserDataSourceDatastore.userKey) ??
        "";
  }

  @override
  Future updateEmail(String email) async {
    return await sharedPreferences.setValue(
        UserDataSourceDatastore.userKey, email);
  }
}
