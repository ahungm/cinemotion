import 'package:cinemotion/domain/datasources/movies_datasource.dart';
import 'package:cinemotion/domain/entities/entities.dart';

import 'package:cinemotion/domain/repositories/movies_repository.dart';

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

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    return datasource.getUpcoming(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    return datasource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    return datasource.getTopRated(page: page);
  }

  @override
  Future<Movie> getMovieById({required String id}) {
    return datasource.getMovieById(id: id);
  }

  @override
  Future<List<Movie>> searchMovies(String query) {
    return datasource.searchMovies(query);
  }

  @override
  Future<List<Video>> getYoutubeVideosById(int movieId) {
    return datasource.getYoutubeVideosById(movieId);
  }

  @override
  Future<List<Movie>> getRelatedMovies({required int id}) {
    return datasource.getRelatedMovies(id: id);
  }
}
