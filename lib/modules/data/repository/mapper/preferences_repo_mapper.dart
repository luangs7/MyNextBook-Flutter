import 'package:mynextbook/modules/data/repository/model/app_preferences_repo.dart';
import 'package:mynextbook/modules/domain/model/app_preferences.dart';

class PreferencesRepoMapper {
  AppPreferencesRepo toRepo(AppPreferences model) {
    return AppPreferencesRepo(
        isEbook: model.isEbook, keyword: model.keyword, isPortuguese: model.isPortuguese, subject: model.subject);
  }

  AppPreferences toDomain(AppPreferencesRepo model) {
    return AppPreferences(
        isEbook: model.isEbook, keyword: model.keyword, isPortuguese: model.isPortuguese, subject: model.subject);
  }
}
