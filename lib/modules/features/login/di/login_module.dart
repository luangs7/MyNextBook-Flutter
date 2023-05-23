import 'package:get_it/get_it.dart';

import '../viewmodel/login_viewmodel.dart';

extension LoginModule on GetIt {
  void loginModule() {
    registerFactory(() => LoginViewModel(
        doLogin: get(),
        getCurrentUser: get(),
        getEmailLogin: get(),
        setEmailLogin: get()));
  }
}
