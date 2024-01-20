import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/presentation/widgets/scaffold_widget.dart';

class {{name.pascalCase()}}Screen extends ConsumerWidget {
  const {{name.pascalCase()}}Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SafeArea(
      child: ScaffoldWidget(
        title: Text('Title'),
        displayAppBar: true,
        appBarDisplayLeading: false,
        body: Center(child: Text('Body')),
        displayBottomNavigationBar: false,
      ),
    );
  }
}
