import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/app_theme.dart';
import '../utils/colored_debug_printer.dart';

class ToggleTheme extends ConsumerWidget {
  const ToggleTheme({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Print.green('[ToggleTheme]', Theme.of(context).brightness.toString());
    return InkWell(
      onTap: () {
        ref.read(appThemeProvider.notifier).toggleTheme();
      },
      child: CircleAvatar(
        child: Icon(
          Theme.of(context).brightness == Brightness.dark ? Icons.light_mode : Icons.dark_mode,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
