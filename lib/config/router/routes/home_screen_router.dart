import 'package:cinemotion/config/router/routes/routes.dart';
import 'package:cinemotion/presentation/views/views.dart';
import 'package:go_router/go_router.dart';
import 'package:cinemotion/presentation/screens/screens.dart';

final StatefulShellRoute homeScreenRouter = StatefulShellRoute.indexedStack(
  // A builder is something that is created in runtime
  builder: (_, _, navigationShell) => HomeScreen(currentChild: navigationShell),
  branches: <StatefulShellBranch>[
    StatefulShellBranch(routes: [homeViewRouter]),
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: '/favorites',
          builder: (context, state) => const FavoritesView(),
        ),
      ],
    ),
  ],
);

// // Routes
RouteBase homeViewRouter = GoRoute(
  path: '/',
  builder: (context, state) => const HomeView(),
  routes: [movieScreenRouter],
);
