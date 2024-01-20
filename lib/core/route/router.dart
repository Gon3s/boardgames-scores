import 'package:go_router/go_router.dart';

import '../../features/game/route.dart';
import '../../features/player/route.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    gamesRoute,
    playerRoute,
  ],
  debugLogDiagnostics: true,
);
