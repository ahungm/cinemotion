// Allows to adapt with ease to multiple use cases

import 'package:cinemotion/domain/entities/movie.dart';
import 'package:cinemotion/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// The typedef is use to simplify the readability of complex implementations (structures, functions)
typedef MovieCallback = Future<List<Movie>> Function({required int page});

// General Provider class
class MoviesNotifier extends Notifier<List<Movie>> {
  // Parameters
  int currentPage = 0;
  bool isLoading = false; // Boolean flag to avoid simultaneous API request
  late final MovieCallback fetchMoreMovies;

  // Build / Initialization method
  @override
  List<Movie> build() {
    // The list will change its state for the movies that are currently being played
    fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
    // The list of movies is empty as an initial state
    return [];
  }

  // Side Effect Methods

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = _setLoading(true);
    currentPage++;
    final List<Movie> currentMovies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...currentMovies];
    await Future.delayed(const Duration(milliseconds: 400));
    isLoading = _setLoading(false);
  }
}

// Methods
bool _setLoading(bool value) => value;

// Use Cases - Providers
final nowPlayingMoviesProvider = NotifierProvider<MoviesNotifier, List<Movie>>(
  MoviesNotifier.new,
);
