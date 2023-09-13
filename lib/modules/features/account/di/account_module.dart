import 'package:get_it/get_it.dart';
import 'package:mynextbook/modules/features/account/viewmodel/account_view_model.dart';

extension AccountModule on GetIt {
  void accountModule() {
    registerLazySingleton<AccountViewModel>(
        () => AccountViewModel(changePassword: get(), deleteAccount: get(), getCurrentUser: get()));
  }
}
