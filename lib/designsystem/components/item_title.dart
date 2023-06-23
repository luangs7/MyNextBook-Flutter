import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/app_theme.dart';
import '../common/app_theme_text.dart';

class ItemTitle extends StatelessWidget {
  final String label;

  const ItemTitle({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      var theme = ref.watch(appThemeProvider);
      return Text(label,
          style: AppTextTheme()
              .h20
              .copyWith(color: theme.appColors.textColor.withOpacity(0.5)),
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis);
    }));
  }
}