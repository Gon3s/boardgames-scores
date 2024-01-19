library app_theme;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_env.dart';
import '../../constants/app_styles.dart';
import '../../constants/app_values.dart';
import '../../data/local/storage_service.dart';
import '../../domain/provider/shared_preferences_storage_service_provider.dart';

part 'provider_theme.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: AppStyles.fontFamily,
    primaryColor: EnvInfo.primaryLightColor,
    colorScheme: ColorScheme.light(
      primary: EnvInfo.primaryLightColor,
      secondary: EnvInfo.secondaryLightColor,
      error: EnvInfo.errorLightColor,
    ),

    //! App Bar
    appBarTheme: AppBarTheme(
      backgroundColor: EnvInfo.backgroundLightColor,
      elevation: AppValues.appBarElevation,
      foregroundColor: EnvInfo.primaryLightColor,
      titleTextStyle: AppStyles.appBarTitleStyle.copyWith(
        color: EnvInfo.textLightColor,
      ),
    ),

    //! Bottom Navigation Bar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: AppValues.bottomNavBarElevation,
      enableFeedback: true,
      type: AppValues.bottomNavBarType,
      backgroundColor: EnvInfo.backgroundLightColor,
      selectedLabelStyle: AppStyles.bottomNavBarSelectedItemTextStyle,
      selectedItemColor: EnvInfo.primaryLightColor,
      unselectedLabelStyle: AppStyles.bottomNavBarUnselectedItemTextStyle,
      unselectedItemColor: EnvInfo.textLightColor,
      selectedIconTheme: IconThemeData(color: EnvInfo.primaryLightColor),
      unselectedIconTheme: IconThemeData(color: EnvInfo.textLightColor),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: AppStyles.fontFamily,
    primaryColor: EnvInfo.primaryDarkColor,
    colorScheme: ColorScheme.dark(
      primary: EnvInfo.primaryDarkColor,
      secondary: EnvInfo.secondaryDarkColor,
      error: EnvInfo.errorDarkColor,
    ),

    //! App Bar
    appBarTheme: AppBarTheme(
      backgroundColor: EnvInfo.backgroundDarkColor,
      elevation: AppValues.appBarElevation,
      foregroundColor: EnvInfo.primaryDarkColor,
      titleTextStyle: AppStyles.appBarTitleStyle.copyWith(
        color: EnvInfo.textDarkColor,
      ),
    ),

    //! Bottom Navigation Bar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: AppValues.bottomNavBarElevation,
      enableFeedback: true,
      type: AppValues.bottomNavBarType,
      backgroundColor: EnvInfo.backgroundDarkColor,
      selectedLabelStyle: AppStyles.bottomNavBarSelectedItemTextStyle,
      selectedItemColor: EnvInfo.primaryDarkColor,
      unselectedLabelStyle: AppStyles.bottomNavBarUnselectedItemTextStyle,
      unselectedItemColor: EnvInfo.textDarkColor,
      selectedIconTheme: IconThemeData(color: EnvInfo.primaryDarkColor),
      unselectedIconTheme: IconThemeData(color: EnvInfo.textDarkColor),
    ),
  );
}
