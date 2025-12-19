import 'package:cinemotion/domain/entities/movie.dart';
import 'package:cinemotion/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Read Only Provider
final movieSlideshowProvider = Provider<List<Movie>>(
  (ref) => _checkNowPlayingMovies(ref: ref),
);

List<Movie> _checkNowPlayingMovies({required Ref ref}) {
  final currentMovies = ref.watch(popularMoviesProvider);
  return currentMovies.isEmpty ? [] : currentMovies.sublist(0, 5);
}
