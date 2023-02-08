import 'package:get_it/get_it.dart';
import 'package:mynextbook/modules/data/datastore/datasource/preferences_datasource_datastore_impl.dart';
import 'package:mynextbook/modules/data/datastore/mapper/app_preferences_mapper.dart';
import 'package:mynextbook/modules/data/repository/datasource/preferences_data_source_datastore.dart';
import 'package:mynextbook/modules/data/datastore/sharedpreferences/custom_sharedpref.dart';

extension DatastoreModule on GetIt {
  void datastoreModule() {
    registerLazySingleton<CustomSharedPref>(() => CustomSharedPrefImpl());
    registerLazySingleton(() => AppPreferencesMapper());
    registerLazySingleton<PreferencesDataSourceDatastore>(
        () => PreferencesDataSourceDatastoreImpl(get(), get()));
  }
}
