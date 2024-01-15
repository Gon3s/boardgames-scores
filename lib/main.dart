import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/app.dart';
import 'core/app_env.dart';
import 'firebase_options.dart';

Future<void> mainCommon(Environment env) async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initFirebase();

  _setupSystemUIOverlayStyle();
  _setupPreferredOrientations();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

Future<void> _initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
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
