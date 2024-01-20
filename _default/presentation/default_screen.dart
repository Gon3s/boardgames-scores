import 'package:boardgames_scores/core/presentation/widgets/scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DefaultScreen extends ConsumerWidget {
  const DefaultScreen({super.key});

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
