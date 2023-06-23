import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/common/base/base_view_model.dart';
import 'package:mynextbook/common/base/view_state.dart';
import 'package:mynextbook/modules/domain/interactor/do_login.dart';
import 'package:mynextbook/modules/domain/interactor/get_current_user.dart';
import 'package:mynextbook/modules/domain/interactor/get_login_email.dart';
import 'package:mynextbook/modules/domain/interactor/set_login_email.dart';
import 'package:mynextbook/modules/domain/model/user.dart';
import 'package:mynextbook/modules/features/login/ui/login_body.dart';

import 'login_state.dart';

final loginViewModelProvider =
    ChangeNotifierProvider((ref) => GetIt.I.get<LoginViewModel>());

class LoginViewModel extends BaseViewModel {
  final DoLogin doLogin;
  final GetEmailLogin getEmailLogin;
  final SetEmailLogin setEmailLogin;
  final GetCurrentUser getCurrentUser;

  LoginViewModel(
      {required this.doLogin,
      required this.getEmailLogin,
      required this.setEmailLogin,
      required this.getCurrentUser}) {
    _loginFormState = LoginState.init();
  }

  LoginState _loginFormState = LoginState.init();
  LoginState get loginFormState => _loginFormState;

  Future login(String email, String password) {
    setLoadingState();
    return doLogin.execute(email, password, null).then((result) {
      result.when(success: (data) async {
        if (data) {
          await setLoginEmail(email);
          setLoginState(ViewState.success(data));
        } else {
          setLoginError(ViewState.error(Exception()));
        }
      }, error: (error) {
        setLoginError(ViewState.error(error));
      }, empty: () {
        setLoginState(ViewState.empty());
      });
    });
  }

  setLoadingState() {
    _loginFormState = _loginFormState.copyWith(
        status: ViewState.loading(),
        isButtonEnabled: false,
        fieldErrors: false);
    notifyListeners();
  }

  setLoginError(ViewState state) {
    _loginFormState =
        _loginFormState.copyWith(status: state, fieldErrors: true);
    notifyListeners();
  }

  setLoginState(ViewState state) {
    _loginFormState = _loginFormState.copyWith(
      status: state,
    );
    notifyListeners();
  }

  resetLoginState() {
    _loginFormState = _loginFormState.copyWith(
      status: ViewState.empty(),
    );
  }

  onPasswordChanged(String value) {
    final isButtonEnabled =
        value.length > 5 && _loginFormState.email.isValidEmail();
    _loginFormState = _loginFormState.copyWith(
        password: value,
        status: ViewState.empty(),
        fieldErrors: false,
        isButtonEnabled: isButtonEnabled);
    notifyListeners();
  }

  onEmailChanged(String value) {
    final isButtonEnabled =
        _loginFormState.password.length > 5 && value.isValidEmail();
    _loginFormState = _loginFormState.copyWith(
        email: value,
        status: ViewState.empty(),
        fieldErrors: false,
        isButtonEnabled: isButtonEnabled);
    notifyListeners();
  }

  Future<String> getLoginEmail() async {
    return await getEmailLogin.execute();
  }

  Future setLoginEmail(String email) async {
    return setEmailLogin.execute(email);
  }

  Future<ViewState<User?>> getUser() async {
    final result = await getCurrentUser.execute();
    return ViewState.success(result);
  }
}
