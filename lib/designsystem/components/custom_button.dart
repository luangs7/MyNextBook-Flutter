import 'package:flutter/material.dart';
import 'package:mynextbook/designsystem/common/app_colors.dart';
import 'package:mynextbook/designsystem/common/app_theme_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.title, required this.onPressed}) : super(key: key);

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 7,
      color: AppColors.dark().accent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      onPressed: () {
        onPressed();
      },
      child: SizedBox(
          width: double.infinity, child: Text(title, textAlign: TextAlign.center, style: AppTextTheme().h30.bold())),
    );
  }
}
