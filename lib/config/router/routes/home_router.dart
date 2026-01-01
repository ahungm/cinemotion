import 'package:cinemotion/config/router/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:cinemotion/presentation/screens/screens.dart';

class HomeRouter {
  static final routePath = '/home/:page';

  static final route = GoRoute(
    path: routePath,
    name: HomeScreen.name,
    builder: (context, state) {
      int pageIndex = int.tryParse(state.pathParameters['page'] ?? '1') ?? 1;

      // Logic to keep it within bounds
      if (pageIndex > 2 || pageIndex < 0) {
        pageIndex = 1;
      }

      return HomeScreen(pageIndex: pageIndex);
    },
    routes: [
      // Ensure MovieRouter.route path is RELATIVE (e.g., 'movie/:id')
      // so it stays inside the Shell/Home hierarchy
      MovieRouter.route,
    ],
  );
}
