import 'package:cinemotion/config/database/database.dart';
import 'package:cinemotion/domain/datasources/local_storage_datasource.dart';
import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:drift/drift.dart' as drift;

class DriftDatasource implements LocalStorageDatasource {
  final AppDatabase defaultDatabase;

  // Flexible instantiation to other databases
  DriftDatasource({AppDatabase? databaseToUse})
    : defaultDatabase = databaseToUse ?? database;

  @override
  Future<void> toggleFavoriteMovie(Movie movie) async {
    final isAlreadyFavorite = await isFavoriteMovie(movie.id);
    isAlreadyFavorite
        ? await _removeFromFavorites(id: movie.id)
        : await _addToFavorites(movie);
  }

  @override
  Future<bool> isFavoriteMovie(int movieId) async {
    // Query creation
    final query = defaultDatabase.select(defaultDatabase.favoriteMovies)
      ..where((table) => table.movieId.equals(movieId));

    // Query execution
    final favoriteMovie = await query.getSingleOrNull();

    // Return of the result
    return (favoriteMovie != null);
  }

  @override
  Future<List<Movie>> loadFavoriteMovies({
    int limitPage = 10,
    int offset = 0,
  }) async {
    // Query creation
    final query = defaultDatabase.select(defaultDatabase.favoriteMovies)
      ..limit(limitPage, offset: offset);

    // Query execution
    final favoriteMoviesRecords = await query.get();

    // Transform the data rows into a Movie List
    final List<Movie> movies = favoriteMoviesRecords
        .map(
          (record) => Movie(
            adult: false,
            backdropPath: record.backdropPath,
            genres: const [],
            id: record.movieId,
            originalLanguage: '',
            originalTitle: record.originalTitle,
            overview: '',
            popularity: record.popularity,
            posterPath: record.posterPath,
            releaseDate: DateTime.now(),
            title: record.title,
            video: false,
            voteAverage: record.voteAverage,
            voteCount: 0,
          ),
        )
        .toList();

    // Return of the result
    return movies;
  }

  // Helper Methods
  Future<void> _removeFromFavorites({required int id}) {
    final deleteQuery = defaultDatabase.delete(defaultDatabase.favoriteMovies)
      ..where((table) => table.movieId.equals(id));

    // Execute deletion
    return deleteQuery.go();
  }

  // Execute insertion
  Future<void> _addToFavorites(Movie movie) => defaultDatabase
      .into(defaultDatabase.favoriteMovies)
      .insert(_mapToCompanion(movie));
}

// Separate translation logic from the database one
FavoriteMoviesCompanion _mapToCompanion(Movie movie) {
  return FavoriteMoviesCompanion.insert(
    movieId: movie.id,
    backdropPath: movie.backdropPath,
    posterPath: movie.posterPath,
    originalTitle: movie.originalTitle,
    title: movie.title,
    // Use drift.Value only if the column is optional/nullable in your Table definition
    voteAverage: drift.Value(movie.voteAverage),
    popularity: drift.Value(movie.popularity),
  );
}
