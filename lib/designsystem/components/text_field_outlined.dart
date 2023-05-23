import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mynextbook/designsystem/common/app_constants.dart';
import 'package:mynextbook/designsystem/common/app_theme.dart';

class TextFieldOutlined extends HookConsumerWidget {
  final TextEditingController controller;
  final String hint;
  final Color hintColor;
  final bool hasError;
  final double padding;
  final String errorMessage;

  const TextFieldOutlined(
      {super.key,
      required this.controller,
      required this.hint,
      required this.hintColor,
      required this.hasError,
      required this.padding,
      required this.errorMessage});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = ref.watch(appThemeProvider);
    final color = hasError ? theme.appColors.error : theme.appColors.textColor;

    return Padding(
        padding: EdgeInsets.all(padding),
        child: TextField(
          controller: controller,
          textInputAction: TextInputAction.done,
          style: TextStyle(color: color),
          decoration: InputDecoration(
              errorText: hasError ? errorMessage : null,
              border: const OutlineInputBorder(),
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: defaultTextSize,
                color: hintColor,
              ),
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: color)),
              errorBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: color))),
        ));
  }
}
