import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/designsystem/common/app_colors.dart';
import 'package:mynextbook/designsystem/common/app_theme_text.dart';
export 'package:mynextbook/designsystem/common/app_theme_text.dart'
    show TextStyleExt;

final appThemeModeProvider =
    StateNotifierProvider<StateController<ThemeMode>, ThemeMode>(
  (ref) => StateController(ThemeMode.dark),
);

final appThemeProvider = Provider<AppTheme>(
  (ref) {
    final mode = ref.watch(appThemeModeProvider);
    switch (mode) {
      case ThemeMode.dark:
        return AppTheme.dark();
      case ThemeMode.light:
      default:
        return AppTheme.light();
    }
  },
);

class AppTheme {
  AppTheme({
    required this.mode,
    required this.data,
    required this.textTheme,
    required this.appColors,
  });

  factory AppTheme.light() {
    const mode = ThemeMode.light;
    final appColors = AppColors.light();
    final themeData = ThemeData.light().copyWith(
      scaffoldBackgroundColor: appColors.background,
      textTheme: ThemeData.light().textTheme.apply(
            bodyColor: AppColors.light().textColor,
            displayColor: AppColors.light().textColor,
          ),
      primaryColor: AppColors.light().accent,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: appColors.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
    return AppTheme(
      mode: mode,
      data: themeData,
      textTheme: AppTextTheme(),
      appColors: appColors,
    );
  }

  factory AppTheme.dark() {
    const mode = ThemeMode.dark;
    final appColors = AppColors.dark();
    final themeData = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: appColors.background,
      textTheme: ThemeData.dark().textTheme.apply(
            bodyColor: AppColors.dark().textColor,
            displayColor: AppColors.dark().textColor,
          ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: appColors.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
    return AppTheme(
      mode: mode,
      data: themeData,
      textTheme: AppTextTheme(),
      appColors: appColors,
    );
  }

  final ThemeMode mode;
  final ThemeData data;
  final AppTextTheme textTheme;
  final AppColors appColors;
}

extension Shadow on AppTheme {
  BoxShadow defaultShadow() {
    return BoxShadow(
      color: Colors.black.withOpacity(0.5),
      offset: const Offset(0, 10),
      blurRadius: 50,
    );
  }
}
