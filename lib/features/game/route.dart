import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/presentation/transitions/fade_transition.dart';
import 'presentation/games_screen.dart';

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
);
