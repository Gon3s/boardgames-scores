import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/screen/error_screen.dart';
import '../../../../core/presentation/widgets/circular_progress_widget.dart';
import '../../../../core/presentation/widgets/scaffold_widget.dart';
import '../../../game/domain/entities/game.dart';
import '../providers/players_list/players_list_notifier.dart';
import '../widgets/players_list_widget.dart';

class PlayerScreen extends ConsumerWidget {
  const PlayerScreen({super.key, required this.game});

  final GameEntity game;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final players = ref.watch(playersListNotifierProvider);

    return SafeArea(
      child: ScaffoldWidget(
        title: Text(
          game.name,
        ),
        displayAppBar: true,
        appBarDisplayLeading: true,
        appBarActions: [
          IconButton(
            onPressed: () {
              context.push('/players/create');
            },
            icon: const Icon(Icons.add),
          ),
        ],
        body: players.when(
          data: (players) => PlayersListWidget(players: players),
          error: (_, error) => ErrorScreen(message: error.toString()),
          loading: () => const CircularProgressWidget(),
        ),
      ),
    );
  }
}
