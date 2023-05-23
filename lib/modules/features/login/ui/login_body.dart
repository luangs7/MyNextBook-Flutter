import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mynextbook/designsystem/components/text_field_outlined.dart';
import 'package:mynextbook/designsystem/components/custom_button.dart';

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
        ),
        TextFieldOutlined(
          controller: passwordTextController,
          hint: "Insira sua senha",
          hintColor: Colors.white30,
          hasError: passwordError,
          padding: 6,
          errorMessage: "Senha incorreta",
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
