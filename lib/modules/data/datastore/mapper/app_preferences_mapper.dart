import 'package:mynextbook/modules/data/datastore/model/app_preference_datastore.dart';
import 'package:mynextbook/modules/data/repository/model/app_preferences_repo.dart';

class AppPreferencesMapper {
  AppPreferenceDatastore toDatastore(AppPreferencesRepo model) {
    return AppPreferenceDatastore(
          isEbook: model.isEbook,
          keyword: model.keyword,
          isPortuguese: model.isPortuguese,
          subject: model.subject
      );
    } 

  AppPreferencesRepo toRepo(AppPreferenceDatastore model) {
    return AppPreferencesRepo(
        isEbook: model.isEbook,
        keyword: model.keyword,
        isPortuguese: model.isPortuguese,
        subject: model.subject
      );
    } 
}