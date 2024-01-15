import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../generated/l10n.dart';
import 'app_env.dart';
import 'presentation/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: EnvInfo.appName,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.lightTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              EnvInfo.appName,
            ),
          ),
          body: const Center(
            child: _MyHomePage(),
          ),
        ),
      ),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  const _MyHomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(S.of(context).helloWorld('Flutter')),
      ),
    );
  }
}
