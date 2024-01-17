import 'package:poc_generic_app/features/config/domain/entities/config.dart';

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
