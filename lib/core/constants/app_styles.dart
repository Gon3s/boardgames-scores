// ignore_for_file: unused_field

import 'package:flutter/material.dart';

import 'app_values.dart';

class AppStyles {
  AppStyles._();

  static const String fontFamily = 'Hindi';

  //! Text letter spacing
  static const double _defaultLetterSpacing = 0;
  static const double _normalLetterSpacing = 0.3;
  static const double _mediumLetterSpacing = 1.2;
  static const double _largeLetterSpacing = 1.5;
  static const double _hugeLetterSpacing = 3;

  //! Font sizes

  static const double _headline1 = 28;
  static const double _headline2 = 24;
  static const double _headline3 = 20;
  static const double _headline4 = 18;
  static const double _title = 16;
  static const double _subtitle = 14;
  static const double _caption = 12;
  static const double _indication = 10;

  //* Custom Text Styles
  //$ App Bar Title
  static TextStyle appBarTitleStyle = const TextStyle(
    fontSize: _title,
    fontWeight: FontWeight.w600,
    letterSpacing: _normalLetterSpacing,
  );

  //$ Bottom Nav Bar
  static TextStyle bottomNavBarSelectedItemTextStyle = const TextStyle(
    fontSize: AppValues.bottomNavBarSelectedLabelFontSize,
    letterSpacing: _defaultLetterSpacing,
  );

  static TextStyle bottomNavBarUnselectedItemTextStyle = const TextStyle(
    fontSize: AppValues.bottomNavBarUnselectedLabelFontSize,
    letterSpacing: _defaultLetterSpacing,
  );
}
