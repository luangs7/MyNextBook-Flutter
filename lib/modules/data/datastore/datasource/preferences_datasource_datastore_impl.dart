import 'dart:convert';

import 'package:mynextbook/modules/data/datastore/mapper/app_preferences_mapper.dart';
import 'package:mynextbook/modules/data/datastore/model/app_preference_datastore.dart';
import 'package:mynextbook/modules/data/datastore/sharedpreferences/custom_sharedpref.dart';
import 'package:mynextbook/modules/data/repository/datasource/preferences_data_source_datastore.dart';
import 'package:mynextbook/modules/data/repository/model/app_preferences_repo.dart';

class PreferencesDataSourceDatastoreImpl
    extends PreferencesDataSourceDatastore {
  final CustomSharedPref sharedPreferences;
  final AppPreferencesMapper mapper;

  PreferencesDataSourceDatastoreImpl(this.sharedPreferences, this.mapper);

  @override
  Future<AppPreferencesRepo> loadPreferences() async {
    String? json = await sharedPreferences
        .getValue(PreferencesDataSourceDatastore.preferencesKey);
    if (json != null) {
      return mapper.toRepo(AppPreferenceDatastore.fromJson(jsonDecode(json)));
    } else {
      return mapper.toRepo(AppPreferenceDatastore(
          isEbook: false, isPortuguese: false, keyword: "", subject: ""));
    }
  }

  @override
  Future<bool> updatePreferences(AppPreferencesRepo preferences) async {
    return await sharedPreferences.setValue(
        PreferencesDataSourceDatastore.preferencesKey,
        jsonEncode(mapper.toDatastore(preferences)));
  }
}
