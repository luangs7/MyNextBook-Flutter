import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mynextbook/designsystem/components/text_field_outlined.dart';
import 'package:mynextbook/designsystem/components/custom_button.dart';

import 'login_signup_dialog.dart';

class LoginBody extends StatelessWidget {
  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;
  final bool emailError;
  final bool passwordError;
  final bool isButtonEnabled;
  final VoidCallback onLoginPressed;

  const LoginBody({
    required this.emailTextController,
    required this.passwordTextController,
    required this.emailError,
    required this.passwordError,
    required this.isButtonEnabled,
    required this.onLoginPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Lottie.network(
          "https://assets2.lottiefiles.com/packages/lf20_ad3uxjiv.json",
          repeat: true,
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width,
        ),
        TextFieldOutlined(
          controller: emailTextController,
          hint: "Insira seu email",
          hintColor: Colors.white30,
          hasError: emailError,
          padding: 6,
          errorMessage: "Email incorreto",
          obscureText: false,
          validation: (value) {
            if (value?.isEmpty == true || value.isValidEmail()) {
              return null;
            }
            return "Email inválido";
          },
        ),
        TextFieldOutlined(
          controller: passwordTextController,
          hint: "Insira sua senha",
          hintColor: Colors.white30,
          hasError: passwordError,
          padding: 6,
          errorMessage: "Senha incorreta",
          obscureText: true,
          validation: (value) {
            if (value?.isEmpty == true) {
              return null;
            }
            if (value == null) {
              return "Campo obrigatório";
            }
            if (value.length < 5) {
              return "Deve conter ao menos 6 caracteres";
            }
            return null;
          },
        ),
        GestureDetector(
          child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text(
                "Cadastrar nova conta",
                textAlign: TextAlign.end,
              )),
          onTap: () {
            showGeneralDialog(
              context: context,
              barrierLabel: "",
              barrierDismissible: true,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, _, __) {
                return LoginSignupDialog(context: context);
              },
            );
          },
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(8),
          child: CustomButton(
            isEnabled: isButtonEnabled,
            title: "Entrar",
            onPressed: onLoginPressed,
          ),
        ),
      ],
    );
  }
}

extension EmailValidator on String? {
  bool isValidEmail() {
    return this == null
        ? false
        : RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(this!.trim());
  }
}
