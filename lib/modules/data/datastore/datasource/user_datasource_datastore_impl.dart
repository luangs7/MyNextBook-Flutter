import 'package:hive/hive.dart';
import 'package:mynextbook/modules/data/repository/datasource/user_datasource_datastore.dart';

class UserDatastoreImpl extends UserDataSourceDatastore {
  final Box box;

  UserDatastoreImpl(this.box);

  @override
  Future<String> loadPreferences() async {
    return await box.get(UserDataSourceDatastore.userKey) ?? "";
  }

  @override
  Future updateEmail(String email) async {
    return await box.put(UserDataSourceDatastore.userKey, email);
  }
}
