import 'package:mynextbook/modules/data/datastore/model/app_preference_datastore.dart';
import 'package:mynextbook/modules/data/repository/model/app_preferences_repo.dart';

class AppPreferencesMapper {
  AppPreferenceDatastore toDatastore(AppPreferencesRepo model) {
    return AppPreferenceDatastore(
      orderBy: model.orderBy,
      isEbook: model.isEbook,
      subject: model.subject,
      title: model.title,
      author: model.author,
      keyword: model.keyword,
      editor: model.editor,
      isPortuguese: model.isPortuguese,
    );
  }

  AppPreferencesRepo toRepo(AppPreferenceDatastore model) {
    return AppPreferencesRepo(
        orderBy: model.orderBy,
        isEbook: model.isEbook,
        isPortuguese: model.isPortuguese,
        subject: model.subject,
        keyword: model.keyword,
        title: model.title,
        author: model.author,
        editor: model.editor);
  }
}
