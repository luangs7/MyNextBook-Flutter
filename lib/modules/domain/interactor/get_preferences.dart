import 'package:mynextbook/modules/domain/model/app_preferences.dart';
import 'package:mynextbook/modules/domain/repositories/preferences_repository.dart';

abstract class GetPreferences {
  Future<AppPreferences> execute();
}

class GetPreferencesImpl extends GetPreferences {
  final PreferencesRepository repository;

  GetPreferencesImpl({required this.repository});

  @override
  Future<AppPreferences> execute() {
    return repository.loadPreferences();
  }
}
