import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/app_env.dart';
import '../../../core/widgets/scaffold_widget.dart';
import '../../../core/widgets/toggle_theme.dart';
import '../../../generated/l10n.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: ScaffoldWidget(
        title: Text(EnvInfo.appName),
        displayAppBar: true,
        appBarDisplayLeading: false,
        appBarActions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ToggleTheme(),
          ),
        ],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.of(context).helloWorld('Flutter')),
              const SizedBox(height: 20),
            ],
          ),
        ),
        displayBottomNavigationBar: true,
      ),
    );
  }
}
