import 'package:mynextbook/modules/domain/model/app_preferences.dart';

abstract class PreferencesRepository {
  Future<bool> updatePreferences(AppPreferences preferences);
  Future<AppPreferences> loadPreferences();
}