import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../designsystem/common/app_theme.dart';
import '../../designsystem/common/app_theme_text.dart';

class FilterTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const FilterTextfield(
      {super.key, required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      var theme = ref.watch(appThemeProvider);

      return TextField(
          style: AppTextTheme().h30.semibold(),
          textCapitalization: TextCapitalization.words,
          controller: controller,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppTextTheme()
                  .h30
                  .semibold()
                  .copyWith(color: theme.appColors.textColor.withOpacity(0.2)),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none));
    });
  }
}
