import 'package:mynextbook/modules/data/repository/model/app_preferences_repo.dart';

abstract class PreferencesDataSourceDatastore {
  Future<void> updatePreferences(AppPreferencesRepo preferences, String userId);
  Future<AppPreferencesRepo> loadPreferences(String userId);

  static const String preferencesKey = "prefkey";
}
