import 'package:cinemotion/config/router/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:cinemotion/presentation/screens/screens.dart';

class HomeRouter {
  static final routePath = '/home/:page';

  static final route = GoRoute(
    path: routePath,
    name: HomeScreen.name,
    builder: (context, state) {
      final pageIndex = int.tryParse(state.pathParameters['page'] ?? '1') ?? 1;
      return HomeScreen(pageIndex: pageIndex);
    },
    routes: [
      MovieRouter.route, // Nesting the movie route here
    ],
  );
}
