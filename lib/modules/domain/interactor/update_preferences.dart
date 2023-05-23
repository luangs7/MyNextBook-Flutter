import 'package:mynextbook/modules/domain/model/app_preferences.dart';
import 'package:mynextbook/modules/domain/repositories/preferences_repository.dart';

abstract class UpdatePreferences {
  Future<void> execute(AppPreferences params, String userId);
}

class UpdatePreferencesImpl extends UpdatePreferences {
  final PreferencesRepository repository;

  UpdatePreferencesImpl({required this.repository});

  @override
  Future<void> execute(AppPreferences params, String userId) {
    return repository.updatePreferences(params, userId);
  }
}
