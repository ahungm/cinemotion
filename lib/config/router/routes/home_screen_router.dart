import 'package:cinemotion/config/router/routes/routes.dart';
import 'package:cinemotion/presentation/views/views.dart';
import 'package:go_router/go_router.dart';
import 'package:cinemotion/presentation/screens/screens.dart';

final ShellRoute homeScreenRouter = ShellRoute(
  // A builder is something that is created in runtime
  builder: (context, state, child) => HomeScreen(childView: child),
  routes: [
    homeViewRouter,
    GoRoute(
      path: '/favorites',
      builder: (context, state) => const FavoritesView(),
    ),
  ],
);

// // Routes
RouteBase homeViewRouter = GoRoute(
  path: '/',
  builder: (context, state) => const HomeView(),
  routes: [movieScreenRouter],
);
