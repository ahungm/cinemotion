import 'package:cinemotion/domain/entities/movie.dart';

abstract class MoviesRepository {
  // The repository would access to the domain entities by
  // using the datasources available
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});
}
