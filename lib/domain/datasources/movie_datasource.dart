import 'package:cinemotion/domain/entities/movie.dart';

abstract class MovieDatasource {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
