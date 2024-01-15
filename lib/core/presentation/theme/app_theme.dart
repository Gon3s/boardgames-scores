import 'package:flutter/material.dart';

import 'index.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: AppTextStyles.fontFamily,
    primaryColor: AppColors.primaryColor,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      error: AppColors.errorColor,
      background: AppColors.backgroundColor,
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.onPrimaryColor,
      elevation: 0,
    ),
  );
}
