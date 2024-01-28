import 'utils/colored_debug_printer.dart';

enum Environment { mock, dev, prod }

abstract class EnvInfo {
  static Environment _environment = Environment.dev;

  static void init(Environment env) {
    _environment = env;
  }

  static String get appName => _environment._appName;
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
  static const _appNames = {
    Environment.mock: 'Mock',
    Environment.dev: 'Dev',
    Environment.prod: 'Prod',
  };

  static const _envNames = {
    Environment.mock: 'MOCK',
    Environment.dev: 'DEV',
    Environment.prod: 'PROD',
  };

  String get _envName => _envNames[this]!;
  String get _appName => _appNames[this]!;
}
