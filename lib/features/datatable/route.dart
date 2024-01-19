import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/presentation/transitions/fade_transition.dart';
import 'presentation/datatable_screen.dart';

final RouteBase dataTableRoute = GoRoute(
  name: 'datatable',
  path: '/datatable',
  pageBuilder: (BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: const DataTableScreen(),
      transitionDuration: const Duration(milliseconds: 150),
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return fadeTransitionBuilder(context, animation, secondaryAnimation, child);
      },
    );
  },
);
