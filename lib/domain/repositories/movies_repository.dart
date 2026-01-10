import 'package:cinemotion/domain/entities/entities.dart';

abstract class MoviesRepository {
  // The repository would access to the domain entities by
  // using the datasources available
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getUpcoming({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> getTopRated({int page = 1});
  Future<Movie> getMovieById({required String id});
  Future<List<Movie>> searchMovies(String query);
  Future<List<Video>> getVideosById(int movieId);
  Future<List<Movie>> getRelatedMovies({required int id});
}
