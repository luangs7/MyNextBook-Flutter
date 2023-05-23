import 'package:mynextbook/modules/data/repository/datasource/preferences_data_source_datastore.dart';
import 'package:mynextbook/modules/data/repository/mapper/preferences_repo_mapper.dart';
import 'package:mynextbook/modules/domain/model/app_preferences.dart';

import 'package:mynextbook/modules/domain/repositories/preferences_repository.dart';

class PreferencesRepositoryImpl extends PreferencesRepository {
  final PreferencesDataSourceDatastore dataSourceDatastore;
  final PreferencesRepoMapper mapper;

  PreferencesRepositoryImpl(
      {required this.dataSourceDatastore, required this.mapper});

  @override
  Future<AppPreferences> loadPreferences(String userId) async {
    final result = await dataSourceDatastore.loadPreferences(userId);
    return mapper.toDomain(result);
  }

  @override
  Future<bool> updatePreferences(
      AppPreferences preferences, String userId) async {
    return await dataSourceDatastore.updatePreferences(
        mapper.toRepo(preferences), userId);
  }
}
