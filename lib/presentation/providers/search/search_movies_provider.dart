import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchedMoviesNotifier extends Notifier<List<Movie>> {
  List<Movie> movies = [];
  late final SearchMoviesCallback searchMovies;

  @override
  List<Movie> build() {
    return movies;
  }

  // Side Effect Methods

  void search(SearchMoviesCallback fetchFuncion) => searchMovies = fetchFuncion;

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    List<Movie> foundMovies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).refreshQuery(query);

    // It is not state = [...state, ...foundMovies], because it
    // just need to keep the latest/most recent search
    state = foundMovies;

    return foundMovies;
  }
}

class FoundedMoviesNotifier extends SearchedMoviesNotifier {
  @override
  List<Movie> build() {
    final repository = ref.watch(movieRepositoryProvider);
    search(repository.searchMovies);
    return movies;
  }
}

// Notifier Provider Implementation
final searchMoviesProvider =
    NotifierProvider<SearchedMoviesNotifier, List<Movie>>(
      FoundedMoviesNotifier.new,
    );
