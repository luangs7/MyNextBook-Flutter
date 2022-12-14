import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/designsystem/common/app_constants.dart';
import 'package:lottie/lottie.dart';
import 'package:mynextbook/designsystem/common/app_theme.dart';
import 'package:mynextbook/designsystem/common/app_theme_text.dart';
import 'package:mynextbook/designsystem/components/custom_button.dart';

class InformationView extends HookConsumerWidget {
  final String title;
  final String subtitle;
  final String buttonTitle;
  final String lottieAnimation;
  final Function? onInformation;
  final Function onNext;

  const InformationView(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.buttonTitle,
      required this.lottieAnimation,
      required this.onInformation,
      required this.onNext});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPaddingV),
      child: Column(children: [
        Lottie.asset("lib/assets/$lottieAnimation.json"),
        const SizedBox(height: defaultMarginBetweenElements),
        GestureDetector(
            onTap: () {
              onInformation?.call();
            },
            child: Column(
              children: [
                Text(title, style: AppTextTheme().h40.bold(), textAlign: TextAlign.center),
                const SizedBox(height: defaultMarginBetweenElements),
                Text(subtitle,
                    style: AppTextTheme().h30.copyWith(color: theme.appColors.textColor.withOpacity(0.5)),
                    textAlign: TextAlign.center)
              ],
            )),
        const Spacer(),
        CustomButton(
            title: buttonTitle,
            onPressed: () {
              onNext();
            })
      ]),
    );
  }
}
