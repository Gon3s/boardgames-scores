import 'package:boardgames_scores/core/presentation/transitions/fade_transition.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'presentation/default_screen.dart';

final RouteBase defaultRoute = GoRoute(
  name: 'default',
  path: '/',
  pageBuilder: (BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: const DefaultScreen(),
      transitionDuration: const Duration(milliseconds: 150),
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return fadeTransitionBuilder(context, animation, secondaryAnimation, child);
      },
    );
  },
);
