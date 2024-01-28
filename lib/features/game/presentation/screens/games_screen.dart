import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_env.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/constants/app_values.dart';
import '../../../../core/presentation/screen/error_screen.dart';
import '../../../../core/presentation/widgets/circular_progress_widget.dart';
import '../../../../core/presentation/widgets/scaffold_widget.dart';
import '../../domain/entities/game.dart';
import '../providers/games_notifier.dart';

class GamesScreen extends ConsumerWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final games = ref.watch(gamesNotifierProvider);

    return SafeArea(
      child: ScaffoldWidget(
        title: Text(EnvInfo.appName),
        displayAppBar: true,
        appBarDisplayLeading: false,
        body: games.when(
          data: (games) => _ContentGamesScreen(games: games),
          error: (_, error) => ErrorScreen(message: error.toString()),
          loading: () => const CircularProgressWidget(),
        ),
        displayBottomNavigationBar: false,
      ),
    );
  }
}

class _ContentGamesScreen extends StatelessWidget {
  const _ContentGamesScreen({
    required this.games,
  });

  final List<GameEntity> games;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppValues.defaultPadding),
          child: Text('Select a game', style: AppStyles.headline1TextStyle),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: games.length,
            itemBuilder: (context, index) {
              final game = games[index];
              return ListTile(
                title: Text(game.name),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => context.push(
                  '/players',
                  extra: game,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
