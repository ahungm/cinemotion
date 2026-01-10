import 'package:cinemotion/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final relatedMoviesProvider = FutureProvider.family((ref, int movieId) {
  final moviesRepository = ref.watch(movieRepositoryProvider);
  return moviesRepository.getRelatedMovies(id: movieId);
});
