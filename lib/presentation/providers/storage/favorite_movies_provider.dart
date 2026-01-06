import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/infrastructure/repositories/local_storage_repository_impl.dart';
import 'package:cinemotion/presentation/providers/storage/local_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StorageMoviesNotifier extends Notifier<Map<int, Movie>> {
  final Map<int, Movie> moviesById = {};
  int page = 0;

  @override
  Map<int, Movie> build() {
    return moviesById;
  }

  // Side Effect Methods
  Future<void> toggleFavoriteMovie(Movie movie) async {
    // Check if the Movie is already marked as Favorite
    final LocalStorageRepositoryImpl localRepository = ref.read(
      localStorageRepositoryProvider,
    );
    final alreadyFavorite = await localRepository.isFavoriteMovie(movie.id);

    // SQL Operation
    await localRepository.toggleFavoriteMovie(movie);

    if (alreadyFavorite) {
      state.remove(movie.id);
      state = {...state}; // Refresh the UI according to the previous operation
      return;
    }

    state = {...state, movie.id: movie}; // Add a new entry to the UI List
  }

  Future<List<Movie>> loadNextPage() async {
    final LocalStorageRepositoryImpl localRepository = ref.read(
      localStorageRepositoryProvider,
    );
    final List<Movie> movies = await localRepository.loadFavoriteMovies(
      limitPage: 10,
      offset: page * 10,
    );

    page++; // Increment the value of the page for every 10 movies loaded

    // Variable to store movies temporaly

    final temporalMovies = <int, Movie>{};

    // Load the next movies by refreshing the UI
    for (final movie in movies) {
      temporalMovies[movie.id] = movie;
    }

    // This allow to refresh the UI just once and not for every favorite movie that is loaded
    state = {...state, ...temporalMovies};

    return movies;
  }
}

final favoriteMoviesProvider =
    NotifierProvider<StorageMoviesNotifier, Map<int, Movie>>(
      StorageMoviesNotifier.new,
    );
