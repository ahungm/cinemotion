import 'package:cinemotion/domain/datasources/local_storage_datasource.dart';
import 'package:cinemotion/domain/entities/movie/movie.dart';

class DriftDatasource implements LocalStorageDatasource {
  @override
  Future<void> toggleFavoriteMovie(Movie movie) {
    // TODO: implement toggleFavoriteMovie
    throw UnimplementedError();
  }

  @override
  Future<bool> isFavoriteMovie(int movieId) {
    // TODO: implement isFavoriteMovie
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> loadFavoriteMovies({int limitPage = 10, int offset = 0}) {
    // TODO: implement loadFavoriteMovies
    throw UnimplementedError();
  }
}
