import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../generated/l10n.dart';
import '../features/config/domain/providers/config_future_provider.dart';
import 'app_env.dart';
import 'presentation/theme/app_theme.dart';
import 'route/router.dart';
import 'utils/colored_debug_printer.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configAsync = ref.watch(configFutureProvider);
    final themeMode = ref.watch(appThemeProvider);

    return configAsync.when(data: (config) {
      EnvInfo.config = config;

      return MaterialApp.router(
        title: EnvInfo.appName,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: themeMode,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        routeInformationProvider: router.routeInformationProvider,
      );
    }, error: (_, error) {
      Print.red('DLOG', error.toString());
      return const _MaterialApp(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Impossible de récupérer les données de paramétrage.',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    }, loading: () {
      return const _MaterialApp(CircularProgressIndicator());
    });
  }
}

class _MaterialApp extends ConsumerWidget {
  const _MaterialApp(this.body);

  final Widget body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      home: Scaffold(
        body: SizedBox.expand(
          child: Center(child: body),
        ),
      ),
    );
  }
}
