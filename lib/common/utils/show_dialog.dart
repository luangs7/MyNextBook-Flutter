import 'package:flutter/material.dart';

void dialog(BuildContext context, Widget child) {
  showDialog(
      context: context,
      barrierLabel: "",
      barrierDismissible: false,
      useSafeArea: false,
      builder: (_) {
        return child;
      });
}