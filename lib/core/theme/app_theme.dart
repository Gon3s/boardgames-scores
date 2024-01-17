library app_theme;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/data/local/storage_service.dart';
import '../app_env.dart';
import '../constants/app_values.dart';
import '../domain/provider/shared_preferences_storage_service_provider.dart';
import '../extensions/color_extensions.dart';
import '../extensions/map_extensions.dart';

part 'provider_theme.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: HexColor.fromHex(
      EnvInfo.config!.lightColors.get(
        'primary',
        defaultValue: '#FFFF00',
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: HexColor.fromHex(
        EnvInfo.config!.lightColors.get(
          'primary',
          defaultValue: '#FFFF00',
        ),
      ),
      secondary: HexColor.fromHex(
        EnvInfo.config!.lightColors.get(
          'secondary',
          defaultValue: '#FFFF00',
        ),
      ),
      error: HexColor.fromHex(
        EnvInfo.config!.lightColors.get(
          'error',
          defaultValue: '#FFFF00',
        ),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: HexColor.fromHex(
      EnvInfo.config!.darkColors.get(
        'primary',
        defaultValue: '#FFFF00',
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: HexColor.fromHex(
        EnvInfo.config!.darkColors.get(
          'primary',
          defaultValue: '#FFFF00',
        ),
      ),
      secondary: HexColor.fromHex(
        EnvInfo.config!.darkColors.get(
          'secondary',
          defaultValue: '#FFFF00',
        ),
      ),
      error: HexColor.fromHex(
        EnvInfo.config!.darkColors.get(
          'error',
          defaultValue: '#FFFF00',
        ),
      ),
    ),
  );
}
