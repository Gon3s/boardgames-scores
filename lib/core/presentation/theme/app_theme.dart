library app_theme;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.green,
      accentColor: Colors.yellow,
      cardColor: Colors.green,
      backgroundColor: Colors.white24,
      brightness: Brightness.light,
    ),

    //! App Bar
    appBarTheme: const AppBarTheme(
      elevation: AppValues.appBarElevation,
    ),

    //! Bottom Navigation Bar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: AppValues.bottomNavBarElevation,
      enableFeedback: true,
      type: AppValues.bottomNavBarType,
      selectedLabelStyle: AppStyles.bottomNavBarSelectedItemTextStyle,
      unselectedLabelStyle: AppStyles.bottomNavBarUnselectedItemTextStyle,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: AppStyles.fontFamily,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.green,
      accentColor: Colors.yellow,
      cardColor: Colors.green,
      backgroundColor: Colors.black26,
      brightness: Brightness.dark,
    ),

    //! App Bar
    appBarTheme: const AppBarTheme(
      elevation: AppValues.appBarElevation,
    ),

    //! Bottom Navigation Bar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: AppValues.bottomNavBarElevation,
      enableFeedback: true,
      type: AppValues.bottomNavBarType,
      selectedLabelStyle: AppStyles.bottomNavBarSelectedItemTextStyle,
      unselectedLabelStyle: AppStyles.bottomNavBarUnselectedItemTextStyle,
    ),
  );
}
