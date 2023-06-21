import 'package:mynextbook/common/base/view_state.dart';

class LoginState {
  final String email;
  final String password;
  final bool isButtonEnabled;
  final bool fieldErrors;
  final ViewState status;
  final String? errorMessage;

  const LoginState({
    required this.email,
    required this.password,
    required this.isButtonEnabled,
    required this.fieldErrors,
    required this.status,
    this.errorMessage,
  });

  LoginState copyWith({
    String? email,
    String? password,
    bool? isButtonEnabled,
    ViewState? status,
    String? errorMessage,
    bool? fieldErrors,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      isButtonEnabled: isButtonEnabled ?? false,
      fieldErrors: fieldErrors ?? false,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  static LoginState init() {
    return LoginState(
      email: "",
      password: "",
      isButtonEnabled: false,
      status: ViewState.loading(),
      fieldErrors: false,
      errorMessage: "",
    );
  }
}
