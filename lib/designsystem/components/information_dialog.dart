import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/app_constants.dart';
import '../common/app_theme.dart';
import '../common/app_theme_text.dart';
import 'custom_button.dart';

class InformationDialog extends StatelessWidget {
  final String buttonLabel;
  final String message;
  final Function onClick;

  const InformationDialog(
      {super.key,
      required this.message,
      required this.buttonLabel,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
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
                    message,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                      isEnabled: true,
                      title: buttonLabel,
                      onPressed: () {
                        Navigator.pop(context);
                        onClick.call();
                      })
                ]))
          ]);
        }));
  }
}
