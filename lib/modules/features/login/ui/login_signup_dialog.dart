import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/designsystem/common/app_constants.dart';
import 'package:mynextbook/designsystem/common/app_theme.dart';
import 'package:mynextbook/designsystem/components/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../designsystem/common/app_theme_text.dart';

class LoginSignupDialog extends HookConsumerWidget {
  final BuildContext context;

  const LoginSignupDialog({super.key, required this.context});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Consumer(builder: (context, ref, child) {
          var theme = ref.watch(appThemeProvider);
          return Wrap(children: [
            Container(
                padding: const EdgeInsets.only(
                    top: defaultPadding,
                    left: defaultPadding,
                    right: defaultPadding),
                decoration: BoxDecoration(
                    color: theme.appColors.background,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(0, 10),
                          blurRadius: 50),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: Column(children: [
                  Text(
                    style: AppTextTheme().h30.dense(),
                    AppLocalizations.of(context).signup_description,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                      isEnabled: true,
                      title: "OK",
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ]))
          ]);
        }));
  }
}
