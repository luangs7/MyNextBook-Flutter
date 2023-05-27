import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/designsystem/common/app_constants.dart';
import 'package:mynextbook/designsystem/common/app_theme.dart';
import 'package:mynextbook/designsystem/components/custom_button.dart';

class LoginSignupDialog extends HookConsumerWidget {
  final BuildContext context;

  const LoginSignupDialog({super.key, required this.context});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        body: Consumer(builder: (context, ref, child) {
          var theme = ref.watch(appThemeProvider);
          return Center(
              child: Wrap(children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Container(
                    padding: const EdgeInsets.all(defaultPadding),
                    decoration: BoxDecoration(
                        color: theme.appColors.background,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(0, 10),
                              blurRadius: 50),
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    child: Column(
                      children: [
                        const Text(
                            "Para se cadastrar, basta digitar um email e uma senha na tela de login e seu cadastro será feito automaticamente."),
                        const SizedBox(height: 30),
                        CustomButton(
                            isEnabled: true,
                            title: "Ok",
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ],
                    )))
          ]));
        }));
  }
}