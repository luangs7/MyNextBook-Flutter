import 'package:flutter/material.dart';
import 'package:mynextbook/designsystem/common/app_colors.dart';
import 'package:mynextbook/designsystem/common/app_theme_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.isEnabled})
      : super(key: key);

  final String title;
  final Function onPressed;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    void buttonAction() {
      onPressed();
    }

    return MaterialButton(
      padding: const EdgeInsets.all(10),
      disabledColor: AppColors.dark().accent.withOpacity(0.3),
      elevation: 7,
      color: AppColors.dark().accent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      onPressed: isEnabled ? buttonAction : null,
      child: SizedBox(
          width: double.infinity,
          child: Text(title,
              textAlign: TextAlign.center, style: AppTextTheme().h30.bold())),
    );
  }
}
