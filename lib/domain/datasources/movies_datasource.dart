import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/domain/entities/video/video.dart';

// API Requests (Endpoints)

// The domain repositories also must handle these methods
abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getUpcoming({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> getTopRated({int page = 1});
  Future<Movie> getMovieById({required String id});
  Future<List<Movie>> searchMovies(String query);
  Future<List<Video>> getVideosById(int movieId);
  Future<List<Movie>> getRelatedMovies({required int id});
}
