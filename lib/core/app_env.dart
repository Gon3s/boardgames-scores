enum Environment { dev, prod }

abstract class EnvInfo {
  static Environment _environment = Environment.dev;

  static void init(Environment env) {
    _environment = env;
  }

  static String get appName => _environment._appName;
  static String get envName => _environment._envName;
  static Environment get environment => _environment;
  static bool get isProduction => _environment == Environment.prod;
}

extension _EnvProperties on Environment {
  static const _appNames = {
    Environment.dev: 'Flutter Starter Kit DEV',
    Environment.prod: 'Flutter Starter Kit',
  };

  static const _envNames = {
    Environment.dev: 'DEV',
    Environment.prod: 'PROD',
  };

  String get _appName => _appNames[this]!;
  String get _envName => _envNames[this]!;
}
