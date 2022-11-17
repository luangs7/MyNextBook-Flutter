import 'package:mynextbook/modules/data/repository/model/app_preferences_repo.dart';

abstract class PreferencesDataSourceDatastore {
  Future<bool> updatePreferences(AppPreferencesRepo preferences);
  Future<AppPreferencesRepo> loadPreferences();

  static const String preferencesKey = "prefkey";
}
