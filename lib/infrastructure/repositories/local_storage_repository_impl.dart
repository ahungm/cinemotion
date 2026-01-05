import 'package:cinemotion/domain/datasources/local_storage_datasource.dart';
import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  final LocalStorageDatasource datasource;

  const LocalStorageRepositoryImpl(this.datasource);

  @override
  Future<void> toggleFavoriteMovie(Movie movie) {
    return datasource.toggleFavoriteMovie(movie);
  }

  @override
  Future<bool> isFavoriteMovie(int movieId) {
    return datasource.isFavoriteMovie(movieId);
  }

  @override
  Future<List<Movie>> loadFavoriteMovies({int limitPage = 10, int offset = 0}) {
    return datasource.loadFavoriteMovies(limitPage: limitPage, offset: offset);
  }
}
