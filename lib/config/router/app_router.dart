import 'package:cinemotion/config/router/routes/home_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  // Main Configuration
  initialLocation: '/home/1',
  redirect: _rootRedirect,
  routes: [HomeRouter.route],
);

String? _rootRedirect(BuildContext context, GoRouterState state) {
  if (state.uri.path == '/') {
    return '/home/1';
  }
  return null;
}
