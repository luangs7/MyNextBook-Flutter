import 'package:get_it/get_it.dart';
import 'package:mynextbook/modules/data/datastore/datasource/preferences_datasource_datastore_impl.dart';
import 'package:mynextbook/modules/data/datastore/mapper/app_preferences_mapper.dart';

extension DatastoreModule on GetIt {
  void datastoreModule() {
    registerLazySingleton(() => AppPreferencesMapper());
    registerFactory(() => PreferencesDataSourceDatastoreImpl(sharedPreferences: get()));
  }
}
