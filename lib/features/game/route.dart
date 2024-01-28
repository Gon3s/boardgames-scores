import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/presentation/transitions/fade_transition.dart';
import 'domain/entities/game.dart';
import 'presentation/screens/game_option_screen.dart';
import 'presentation/screens/games_screen.dart';
import 'presentation/screens/play_game_screen.dart';

final RouteBase gamesRoute = GoRoute(
  name: 'games',
  path: '/',
  pageBuilder: (BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: const GamesScreen(),
      transitionDuration: const Duration(milliseconds: 150),
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return fadeTransitionBuilder(context, animation, secondaryAnimation, child);
      },
    );
  },
  routes: <RouteBase>[
    GoRoute(
      name: 'option',
      path: 'option',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: GameOptionScreen(game: state.extra! as GameEntity),
          transitionDuration: const Duration(milliseconds: 150),
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
            return fadeTransitionBuilder(context, animation, secondaryAnimation, child);
          },
        );
      },
    ),
    GoRoute(
      name: 'play',
      path: 'play',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: PlayGameScreen(game: state.extra! as GameEntity),
          transitionDuration: const Duration(milliseconds: 150),
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
            return fadeTransitionBuilder(context, animation, secondaryAnimation, child);
          },
        );
      },
    ),
  ],
);
