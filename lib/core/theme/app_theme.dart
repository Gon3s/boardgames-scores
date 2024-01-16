library app_theme;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter_kit/core/constants/app_values.dart';
import 'package:flutter_starter_kit/core/data/local/storage_service.dart';
import 'package:flutter_starter_kit/core/utils/colored_debug_printer.dart';

import '../domain/provider/shared_preferences_storage_service_provider.dart';

part 'provider_theme.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF00629D),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFCFE5FF),
      onPrimaryContainer: Color(0xFF001D33),
      secondary: Color(0xFF97480E),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFFFDBC9),
      onSecondaryContainer: Color(0xFF331200),
      tertiary: Color(0xFF00629F),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFD0E4FF),
      onTertiaryContainer: Color(0xFF001D34),
      error: Color(0xFFBA1A1A),
      errorContainer: Color(0xFFFFDAD6),
      onError: Color(0xFFFFFFFF),
      onErrorContainer: Color(0xFF410002),
      background: Color(0xFFFCFCFF),
      onBackground: Color(0xFF1A1C1E),
      surface: Color(0xFFFCFCFF),
      onSurface: Color(0xFF1A1C1E),
      surfaceVariant: Color(0xFFDEE3EB),
      onSurfaceVariant: Color(0xFF42474E),
      outline: Color(0xFF72777F),
      onInverseSurface: Color(0xFFF1F0F4),
      inverseSurface: Color(0xFF2F3033),
      inversePrimary: Color(0xFF98CBFF),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFF00629D),
      outlineVariant: Color(0xFFC2C7CF),
      scrim: Color(0xFF000000),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF98CBFF),
      onPrimary: Color(0xFF003354),
      primaryContainer: Color(0xFF004A77),
      onPrimaryContainer: Color(0xFFCFE5FF),
      secondary: Color(0xFFFFB68D),
      onSecondary: Color(0xFF532200),
      secondaryContainer: Color(0xFF763300),
      onSecondaryContainer: Color(0xFFFFDBC9),
      tertiary: Color(0xFF9ACBFF),
      onTertiary: Color(0xFF003355),
      tertiaryContainer: Color(0xFF004A79),
      onTertiaryContainer: Color(0xFFD0E4FF),
      error: Color(0xFFFFB4AB),
      errorContainer: Color(0xFF93000A),
      onError: Color(0xFF690005),
      onErrorContainer: Color(0xFFFFDAD6),
      background: Color(0xFF1A1C1E),
      onBackground: Color(0xFFE2E2E5),
      surface: Color(0xFF1A1C1E),
      onSurface: Color(0xFFE2E2E5),
      surfaceVariant: Color(0xFF42474E),
      onSurfaceVariant: Color(0xFFC2C7CF),
      outline: Color(0xFF8C9199),
      onInverseSurface: Color(0xFF1A1C1E),
      inverseSurface: Color(0xFFE2E2E5),
      inversePrimary: Color(0xFF00629D),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFF98CBFF),
      outlineVariant: Color(0xFF42474E),
      scrim: Color(0xFF000000),
    ),
  );
}
