import 'package:mynextbook/modules/domain/model/app_preferences.dart';
import 'package:mynextbook/modules/domain/repositories/preferences_repository.dart';

abstract class UpdatePreferences {
  Future<void> execute(AppPreferences params);
}

class UpdatePreferencesImpl extends UpdatePreferences {
  final PreferencesRepository repository;

  UpdatePreferencesImpl({required this.repository});

  @override
  Future<void> execute(AppPreferences params) {
    return repository.updatePreferences(params);
  }
}
