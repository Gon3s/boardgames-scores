import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'presentation/home_screen.dart';

final RouteBase homeRoute = GoRoute(
  path: '/',
  builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
);
