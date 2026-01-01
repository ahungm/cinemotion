import 'package:go_router/go_router.dart';
import 'package:cinemotion/presentation/screens/screens.dart';

class MovieRouter {
  static final routePath = 'movie/:id';
  static final route = GoRoute(
    path: routePath, // Sub-route
    name: MovieScreen.name,
    builder: (context, state) => MovieScreen(movieId: _getMovieId(state)),
  );
}

// Methods
String _getMovieId(GoRouterState state) {
  final String movieId = state.pathParameters['id'] ?? 'non-existent-id';
  return movieId;
}
