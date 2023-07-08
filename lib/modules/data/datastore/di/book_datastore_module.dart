import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:mynextbook/modules/data/datastore/datasource/preferences_datasource_datastore_impl.dart';
import 'package:mynextbook/modules/data/datastore/datasource/user_datasource_datastore_impl.dart';
import 'package:mynextbook/modules/data/datastore/mapper/app_preferences_mapper.dart';
import 'package:mynextbook/modules/data/repository/datasource/preferences_data_source_datastore.dart';
import 'package:mynextbook/modules/data/repository/datasource/user_datasource_datastore.dart';

extension DatastoreModule on GetIt {
  void datastoreModule() {
    registerSingletonAsync<Box>(() => Hive.openBox("MNB_Box"));
    registerLazySingleton(() => AppPreferencesMapper());
    registerLazySingleton<PreferencesDataSourceDatastore>(
        () => PreferencesDataSourceDatastoreImpl(get(), get()));
    registerLazySingleton<UserDataSourceDatastore>(
        () => UserDatastoreImpl(get()));
  }
}
