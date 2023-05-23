import 'package:get_it/get_it.dart';
import 'package:mynextbook/modules/features/preferences/viewmodel/preferences_view_model.dart';

extension PreferencesModule on GetIt {
  void preferencesModule() {
    registerFactory(() => PreferencesViewModel(
        updatePreferences: get(),
        getPreferences: get(),
        getCurrentUser: get()));
  }
}
