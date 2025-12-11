import 'package:cinemotion/domain/datasources/movies_datasource.dart';
import 'package:cinemotion/domain/entities/movie.dart';
import 'package:cinemotion/domain/repositories/movie_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  // Parameters / Attributes

  // Generic source to obtain the movies (father class)
  // and later provide an easy way to change it
  final MoviesDatasource datasource;

  // Datasource implementation within the repository
  MoviesRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    return datasource.getNowPlaying(page: page);
  }
}
