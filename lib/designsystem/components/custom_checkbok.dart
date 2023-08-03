import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/designsystem/common/app_theme.dart';
import 'package:mynextbook/designsystem/common/app_theme_text.dart';

class CustomCheckbox extends HookConsumerWidget {
  final StateProvider provider;
  final String label;

  const CustomCheckbox(
      {super.key, required this.provider, required this.label});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = ref.watch(appThemeProvider);
    var changedValue = ref.watch(provider);
    return Row(
      children: [
        Expanded(
          flex: 10,
          child: Text(label,
              style: AppTextTheme().h30.bold(), textAlign: TextAlign.start),
        ),
        Expanded(
          child: Checkbox(
              checkColor: theme.appColors.accent,
              value: changedValue,
              onChanged: (newValue) {
                ref.read(provider.notifier).state = newValue;
              }),
        )
      ],
    );
  }
}
