import 'package:cinemotion/domain/entities/movie/movie.dart';

abstract class LocalStorageDatasource {
  Future<void> toggleFavoriteMovie(Movie movie);
  Future<bool> isFavoriteMovie(int movieId);
  Future<List<Movie>> loadFavoriteMovies({int limitPage = 10, int offset = 0});
}
