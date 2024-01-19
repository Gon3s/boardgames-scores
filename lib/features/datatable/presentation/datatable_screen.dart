import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/app_env.dart';
import '../../../core/presentation/widgets/scaffold_widget.dart';

class DataTableScreen extends ConsumerWidget {
  const DataTableScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: ScaffoldWidget(
        title: Text(EnvInfo.appName),
        displayAppBar: true,
        appBarDisplayLeading: false,
        body: const Center(
          child: Text('DATA TABLE SCREEN'),
        ),
        displayBottomNavigationBar: true,
        currentIndex: 1,
      ),
    );
  }
}
