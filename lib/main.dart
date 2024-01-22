import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/app.dart';
import 'core/app_env.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const String environment = String.fromEnvironment('Environment');
  _setEnvironmentFromStringValue(environment);

  _setupSystemUIOverlayStyle();
  _setupPreferredOrientations();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

void _setupPreferredOrientations() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

void _setupSystemUIOverlayStyle() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
    ),
  );
}

void _setEnvironmentFromStringValue(String environment) {
  switch (environment) {
    case 'mock':
      EnvInfo.init(Environment.mock);
    case 'dev':
      EnvInfo.init(Environment.dev);
    case 'prod':
      EnvInfo.init(Environment.prod);
  }

  

  EnvInfo.describe();
}
