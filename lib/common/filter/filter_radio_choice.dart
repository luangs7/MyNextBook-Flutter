import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../designsystem/common/app_theme_text.dart';
import 'filter_dialog.dart';

class FilterRadio extends HookConsumerWidget {
  final String? currentValue;
  final String relevance = "relevance";
  final String newest = "newest";

  const FilterRadio({super.key, required this.currentValue});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderBy = useState(currentValue);
    final orderState = ref.watch(orderByState.notifier);

    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: 0,
          title: Text(AppLocalizations.of(context).relevance,
              style: AppTextTheme().h30.light()),
          trailing: Radio(
              value: relevance,
              groupValue: orderBy.value,
              onChanged: ((value) {
                orderBy.value = value;
                orderState.state = value;
              })),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: 0,
          title: Text(AppLocalizations.of(context).newest,
              style: AppTextTheme().h30.light()),
          trailing: Radio(
              value: newest,
              groupValue: orderBy.value,
              onChanged: ((value) {
                orderBy.value = value;
                orderState.state = value;
              })),
        ),
      ],
    );
  }
}
