import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/widgets/scaffold_widget.dart';
import '../../domain/entities/game.dart';
import 'games/draftosaurus/options_screen.dart';

class GameOptionScreen extends ConsumerWidget {
  final GameEntity game;

  const GameOptionScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: ScaffoldWidget(
          title: Text(
            game.name,
          ),
          displayAppBar: true,
          appBarDisplayLeading: true,
          body: game.name == 'Draftosaurus'
              ? DraftosaurusOptionScreen(game: game)
              : const Center(
                  child: Text('No option screen for this game'),
                )),
    );
  }
}
