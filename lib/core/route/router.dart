import 'package:go_router/go_router.dart';

import '../../features/game/route.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    gamesRoute,
  ],
);
