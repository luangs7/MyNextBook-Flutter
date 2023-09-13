import 'package:flutter/material.dart';
import 'package:mynextbook/designsystem/common/app_constants.dart';

import '../common/app_theme_text.dart';

class ItemTitleGrid extends StatelessWidget {
  final String label;

  const ItemTitleGrid({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: defaultPaddingV),
        child: Text(label,
            style:
            AppTextTheme().h20.copyWith(color: Colors.white70).bold(),
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis));
  }
}
