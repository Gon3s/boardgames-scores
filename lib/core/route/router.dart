import 'package:go_router/go_router.dart';

import '../../features/datatable/route.dart';
import '../../features/home/route.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    homeRoute,
    dataTableRoute,
  ],
  debugLogDiagnostics: true,
);
