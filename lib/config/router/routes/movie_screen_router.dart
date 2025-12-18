import 'package:go_router/go_router.dart';
import 'package:cinemotion/presentation/screens/screens.dart';

RouteBase movieScreenRouter = GoRoute(
  path:
      '/movie/:id', // It specifies that the routes will always receive a String parameter (in this, the id of the movie)
  name: MovieScreen.name,
  builder: (context, state) => MovieScreen(movieId: _getMovieId(state)),
);

// Methods
String _getMovieId(GoRouterState state) {
  final String movieId = state.pathParameters['id'] ?? 'non-existent-id';
  return movieId;
}
