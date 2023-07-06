import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mynextbook/designsystem/common/app_constants.dart';
import 'package:mynextbook/designsystem/common/app_theme.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TextFieldState {
  final String? errorMessage;
  final bool hasError;

  TextFieldState({required this.errorMessage, required this.hasError});
}

class TextFieldOutlined extends HookConsumerWidget {
  final TextEditingController controller;
  final String hint;
  final Color hintColor;
  final bool hasError;
  final double padding;
  final String? errorMessage;
  final bool obscureText;
  final String? Function(String?) validation;

  const TextFieldOutlined(
      {super.key,
      required this.controller,
      required this.hint,
      required this.hintColor,
      required this.hasError,
      required this.padding,
      this.errorMessage,
      required this.obscureText,
      required this.validation});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = ref.watch(appThemeProvider);
    final fieldState = useState(
        TextFieldState(errorMessage: errorMessage, hasError: hasError));
    final color = fieldState.value.hasError
        ? theme.appColors.error
        : theme.appColors.textColor;

    return Padding(
        padding: EdgeInsets.all(padding),
        child: TextField(
          onChanged: (value) {
            final result = validation(value);
            if (result != null) {
              fieldState.value =
                  TextFieldState(errorMessage: result, hasError: true);
            } else {
              fieldState.value =
                  TextFieldState(errorMessage: "", hasError: false);
            }
          },
          obscureText: obscureText,
          controller: controller,
          textInputAction: TextInputAction.done,
          style: TextStyle(color: color),
          decoration: InputDecoration(
              errorText: fieldState.value.hasError
                  ? fieldState.value.errorMessage
                  : null,
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
