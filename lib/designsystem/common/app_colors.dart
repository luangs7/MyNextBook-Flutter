import 'package:flutter/material.dart';

const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFF3D2468);
const kPrimaryColor = Color(0xFF6200EE);

class AppColors {
  const AppColors(
      {required this.background,
      required this.accent,
      required this.disabled,
      required this.error,
      required this.divider,
      required this.signIn,
      required this.signOut,
      required this.textColor});

  factory AppColors.light() {
    return const AppColors(
      background: Colors.white,
      accent: Color(0xff17c063),
      disabled: Colors.black12,
      error: Color(0xffff7466),
      divider: Colors.black54,
      signIn: Color(0xff4285f4),
      signOut: Color(0xffc53829),
      textColor: Colors.black,
    );
  }

  factory AppColors.dark() {
    return const AppColors(
        background: kBackgroundColor,
        accent: kPrimaryColor,
        disabled: Colors.white12,
        error: Color(0xffff5544),
        divider: Colors.white54,
        signIn: Color(0xff4285f4),
        signOut: Color(0xffc53829),
        textColor: Colors.white);
  }

  final Color background;
  final Color accent;
  final Color disabled;
  final Color error;
  final Color divider;
  final Color textColor;
  final Color signIn;
  final Color signOut;
}
