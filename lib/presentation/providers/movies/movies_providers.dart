// Allows to adapt with ease to multiple use cases

import 'package:cinemotion/domain/entities/movie/movie.dart';
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
  List<Movie> movies = [];

  // Build / Initialization method
  @override
  List<Movie> build() {
    // The list of movies is empty as an initial state
    return movies;
  }

  // Side Effect Methods

  // Initialize
  void fetch(MovieCallback fetchFuncion) => fetchMoreMovies = fetchFuncion;

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

// Provider classes
class NowPlayingMoviesNotifier extends MoviesNotifier {
  @override
  List<Movie> build() {
    final repository = ref.watch(movieRepositoryProvider);
    fetch(repository.getNowPlaying);
    return movies;
  }
}

class UpcomingMoviesNotifier extends MoviesNotifier {
  @override
  List<Movie> build() {
    final repository = ref.watch(movieRepositoryProvider);
    fetch(repository.getUpcoming);
    return movies;
  }
}

class PopularMoviesNotifier extends MoviesNotifier {
  @override
  List<Movie> build() {
    final repository = ref.watch(movieRepositoryProvider);
    fetch(repository.getPopular);
    return movies;
  }
}

class TopRatedMoviesNotifier extends MoviesNotifier {
  @override
  List<Movie> build() {
    final repository = ref.watch(movieRepositoryProvider);
    fetch(repository.getTopRated);
    return movies;
  }
}

// Use Cases - Providers
final nowPlayingMoviesProvider =
    NotifierProvider<NowPlayingMoviesNotifier, List<Movie>>(
      NowPlayingMoviesNotifier.new,
    );

final upcomingMoviesProvider =
    NotifierProvider<UpcomingMoviesNotifier, List<Movie>>(
      UpcomingMoviesNotifier.new,
    );

final popularMoviesProvider =
    NotifierProvider<PopularMoviesNotifier, List<Movie>>(
      PopularMoviesNotifier.new,
    );

final topRatedMoviesProvider =
    NotifierProvider<TopRatedMoviesNotifier, List<Movie>>(
      TopRatedMoviesNotifier.new,
    );
