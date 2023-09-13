import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mynextbook/common/utils/validations.dart';
import 'package:mynextbook/designsystem/components/text_field_outlined.dart';
import 'package:mynextbook/designsystem/components/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../designsystem/common/lottie_states.dart';
import '../../../../designsystem/components/information_dialog.dart';

class LoginBody extends StatelessWidget {
  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;
  final bool emailError;
  final bool passwordError;
  final bool isButtonEnabled;
  final VoidCallback onLoginPressed;

  const LoginBody({
    super.key,
    required this.emailTextController,
    required this.passwordTextController,
    required this.emailError,
    required this.passwordError,
    required this.isButtonEnabled,
    required this.onLoginPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView(physics: const BouncingScrollPhysics(), children: [
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Lottie.network(
              lottieLogin,
              repeat: true,
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          TextFieldOutlined(
            controller: emailTextController,
            hint: AppLocalizations.of(context).email_field,
            hintColor: Colors.white30,
            hasError: emailError,
            padding: 6,
            obscureText: false,
            action: TextInputAction.next,
            textInputType: TextInputType.emailAddress,
            validation: (value) => doEmailValidation(context, value),
          ),
          TextFieldOutlined(
            controller: passwordTextController,
            hint: AppLocalizations.of(context).password_field,
            hintColor: Colors.white30,
            hasError: passwordError,
            padding: 6,
            obscureText: true,
            validation: (value) => doPasswordValidation(context, value),
          ),
          GestureDetector(
            child: Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  AppLocalizations.of(context).signup,
                  textAlign: TextAlign.end,
                )),
            onTap: () {
              showDialog(
                context: context,
                barrierLabel: "",
                barrierDismissible: true,
                builder: (context) {
                  return InformationDialog(
                    message: AppLocalizations.of(context).signup_description,
                    buttonLabel: "Ok",
                    onClick: (){},
                  );
                },
              );
            },
          ),
        ])),
        CustomButton(
          isEnabled: isButtonEnabled,
          title: AppLocalizations.of(context).signin,
          onPressed: onLoginPressed,
        )
      ],
    );
  }

  String? doEmailValidation(BuildContext context, String? value) {
    if (value?.isEmpty == true || value.isValidEmail()) {
      return null;
    }
    return AppLocalizations.of(context).email_invalid;
  }

  String? doPasswordValidation(BuildContext context, String? value) {
    if (value?.isEmpty == true) {
      return null;
    }
    if (value == null) {
      return AppLocalizations.of(context).field_needed;
    }
    if (value.length <= 5) {
      return AppLocalizations.of(context).password_size;
    }
    return null;
  }
}
