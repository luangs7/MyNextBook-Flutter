import 'package:flutter/material.dart';

import '../common/app_theme_text.dart';

class ItemTitle extends StatelessWidget {
  final String label;

  const ItemTitle({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(label,
        style: AppTextTheme().h40.copyWith(color: Colors.black).bold(),
        textAlign: TextAlign.center,
        maxLines: 3,
        overflow: TextOverflow.ellipsis);
  }
}
