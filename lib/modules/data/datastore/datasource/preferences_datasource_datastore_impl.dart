
import 'package:mynextbook/modules/data/repository/datasource/preferences_data_source_datastore.dart';
import 'package:mynextbook/modules/data/repository/model/app_preferences_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesDataSourceDatastoreImpl extends PreferencesDataSourceDatastore {
  final SharedPreferences sharedPreferences;

  PreferencesDataSourceDatastoreImpl({required this.sharedPreferences});

  @override
  Future<AppPreferencesRepo> loadPreferences() async {
    String? json = sharedPreferences.getString(PreferencesDataSourceDatastore.preferencesKey);
    if(json != null){
     return AppPreferencesRepo.fromJson(json);
    } else {
      return AppPreferencesRepo(isEbook: false, isPortuguese: false, keyword: "", subject: "");
  }
}

  @override
  Future<bool> updatePreferences(AppPreferencesRepo preferences) async {
        return sharedPreferences.setString(PreferencesDataSourceDatastore.preferencesKey, preferences.toJson().toString());
  }
}