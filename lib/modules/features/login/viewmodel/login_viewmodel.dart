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
      required this.getCurrentUser});

  Future login(String email, String password) {
    setState(ViewState.loading());
    return doLogin.execute(email, password, null).then((result) {
      result.when(success: (data) async {
        if (data) {
          await setLoginEmail(email);
          setState(ViewState.success(data));
        } else {
          setState(ViewState.error(Exception()));
        }
      }, error: (error) {
        setState(ViewState.error(error));
      }, empty: () {
        setState(ViewState.empty());
      });
    });
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
