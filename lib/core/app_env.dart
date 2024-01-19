import 'package:flutter/material.dart';

import '../features/config/domain/entities/config.dart';
import 'extensions/color_extensions.dart';
import 'utils/colored_debug_printer.dart';

enum Environment { mock, dev, prod }

abstract class EnvInfo {
  static ConfigEntity? config;
  static Environment _environment = Environment.dev;

  static void init(Environment env) {
    _environment = env;
  }

  static String get appName => config?.appName ?? '';
  static String get envName => _environment._envName;
  static Environment get environment => _environment;
  static bool get isProduction => _environment == Environment.prod;

  //* Colors
  static Color get textLightColor => HexColor.fromHex(
        config!.lightColors.text
      );
  static Color get primaryLightColor => HexColor.fromHex(
        config!.lightColors.primary
      );
  static Color get secondaryLightColor => HexColor.fromHex(
        config!.lightColors.secondary
      );
  static Color get errorLightColor => HexColor.fromHex(
        config!.lightColors.error
      );
  static Color get backgroundLightColor => HexColor.fromHex(
        config!.lightColors.background
      );

  //^ Dark Colors
  static Color get textDarkColor => HexColor.fromHex(
        config!.darkColors.text
      );
  static Color get primaryDarkColor => HexColor.fromHex(
        config!.darkColors.primary
      );
  static Color get secondaryDarkColor => HexColor.fromHex(
        config!.darkColors.secondary
      );
  static Color get errorDarkColor => HexColor.fromHex(
        config!.darkColors.error
      );
  static Color get backgroundDarkColor => HexColor.fromHex(
        config!.darkColors.background
      );

  static void describe() {
    Print.white(
      'ENVIRONMENT',
      ' ---------------------------------------------------------------------------------------',
    );

    Print.yellow(
      'ENVIRONMENT',
      ' | Environment      : $envName',
    );

    Print.white(
      'ENVIRONMENT',
      ' ---------------------------------------------------------------------------------------',
    );
  }
}

extension _EnvProperties on Environment {
  static const _envNames = {
    Environment.mock: 'MOCK',
    Environment.dev: 'DEV',
    Environment.prod: 'PROD',
  };

  String get _envName => _envNames[this]!;
}
