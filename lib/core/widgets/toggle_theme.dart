import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/app_theme.dart';

class ToggleTheme extends ConsumerWidget {
  
  final double size;
  const ToggleTheme({super.key, this.size = 20.0});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(appThemeProvider.notifier).toggleTheme();
      },
      child: CircleAvatar(
        child: Icon(
          Theme.of(context).brightness == Brightness.dark ? Icons.light_mode : Icons.dark_mode,
          color: Theme.of(context).iconTheme.color,
          size: size,
        ),
      ),
    );
  }
}
