import 'package:mynextbook/modules/data/datastore/mapper/app_preferences_mapper.dart';
import 'package:mynextbook/modules/data/datastore/model/app_preference_datastore.dart';
import 'package:mynextbook/modules/data/repository/datasource/preferences_data_source_datastore.dart';
import 'package:mynextbook/modules/data/repository/model/app_preferences_repo.dart';
import 'package:hive/hive.dart';

class PreferencesDataSourceDatastoreImpl
    extends PreferencesDataSourceDatastore {
  final AppPreferencesMapper mapper;
  final Box box;

  PreferencesDataSourceDatastoreImpl(this.mapper, this.box);

  @override
  Future<AppPreferencesRepo> loadPreferences(String userId) async {
    final preferences =
        box.get(PreferencesDataSourceDatastore.preferencesKey + userId);
    if (preferences != null) {
      return mapper.toRepo(preferences);
    } else {
      return mapper.toRepo(AppPreferenceDatastore.init());
    }
  }

  @override
  Future<void> updatePreferences(
      AppPreferencesRepo preferences, String userId) async {
    return await box.put(PreferencesDataSourceDatastore.preferencesKey + userId,
        mapper.toDatastore(preferences));
  }
}
