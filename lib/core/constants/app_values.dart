import 'package:flutter/material.dart';

class AppValues {
  AppValues._();

  static const String appThemeStorageKey = 'AppTheme';

  //$ Margins
  static const double defaultMargin = 16;

  //$ Paddings
  static const double defaultPadding = 16;

  //$ Default Radius
  static const double defaultRadius = 8;

  //$ Elevation
  static const double defaultElevation = 2;

  //? AppBar
  static const double appBarElevation = defaultElevation;

  //? Bottom Navigation bar
  static BottomNavigationBarType bottomNavBarType = BottomNavigationBarType.fixed;
  static const double bottomNavBarSelectedLabelFontSize = 12;
  static const double bottomNavBarUnselectedLabelFontSize = 12;
  static const double bottomNavBarIconSize = 20;
  static const double bottomNavBarElevation = defaultElevation;

}
