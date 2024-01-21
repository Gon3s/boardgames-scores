import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/presentation/transitions/fade_transition.dart';
import '../game/domain/entities/game.dart';
import 'presentation/screens/create_player_screen.dart';
import 'presentation/screens/player_screen.dart';

final RouteBase playerRoute = GoRoute(
  name: 'player',
  path: '/players',
  pageBuilder: (BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: PlayerScreen(game: state.extra! as GameEntity),
      transitionDuration: const Duration(milliseconds: 150),
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return fadeTransitionBuilder(context, animation, secondaryAnimation, child);
      },
    );
  },
  routes: <RouteBase>[
    GoRoute(
      name: 'createPlayer',
      path: 'create',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: CreatePlayerScreen(),
          transitionDuration: const Duration(milliseconds: 150),
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
            return fadeTransitionBuilder(context, animation, secondaryAnimation, child);
          },
        );
      },
    ),
  ],
);
