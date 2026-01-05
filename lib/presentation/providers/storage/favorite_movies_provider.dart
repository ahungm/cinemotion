import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/infrastructure/repositories/local_storage_repository_impl.dart';
import 'package:cinemotion/presentation/providers/storage/local_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StorageMoviesNotifier extends Notifier<Map<int, Movie>> {
  final Map<int, Movie> moviesById = {};

  @override
  Map<int, Movie> build() {
    int page = 0;
    final LocalStorageRepositoryImpl repository = ref.watch(
      localStorageRepositoryProvider,
    );

    return moviesById;
  }

  // Side Effect Methods
  Future<void> toggleFavoriteMovie(Movie movie) async {
    final localRepository = ref.read(localStorageRepositoryProvider);

    // Check if the Movie is already marked as Favorite
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
}

final favoriteMoviesProvider =
    NotifierProvider<StorageMoviesNotifier, Map<int, Movie>>(
      StorageMoviesNotifier.new,
    );
