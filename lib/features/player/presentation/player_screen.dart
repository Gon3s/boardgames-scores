import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/presentation/widgets/scaffold_widget.dart';
import '../../game/domain/entities/game.dart';

class PlayerScreen extends ConsumerWidget {
  const PlayerScreen({super.key, required this.game});

  final GameEntity game;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: ScaffoldWidget(
        title: const Text('Title'),
        displayAppBar: true,
        appBarDisplayLeading: true,
        appBarOnLeadingPressed: () => context.pop(true),
        body: Center(child: Text('Game: ${game.name}')),
        displayBottomNavigationBar: false,
      ),
    );
  }
}
