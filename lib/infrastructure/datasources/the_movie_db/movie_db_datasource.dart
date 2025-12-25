import 'package:cinemotion/constants/environment.dart';
import 'package:cinemotion/domain/datasources/movies_datasource.dart';
import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemotion/infrastructure/models/the-movie-db/movie_from_the_movie_db.dart';
import 'package:cinemotion/infrastructure/models/the-movie-db/single_move_details.dart';
import 'package:cinemotion/infrastructure/models/the-movie-db/the_movie_db_response_dto.dart';
import 'package:dio/dio.dart';

// Datasource created to manage all the interactions with
// The Movie DB API
class MovieDbDatasource implements MoviesDatasource {
  // Dio Instance
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        //
        'api_key': Environment().apiKey,
        // TODO: Pasarlo como variable y a cambiar el idioma luego en el AppTheme
        'language': 'es-MX',
      },
    ),
  );

  // Datasource methods

  // Get Now Playing Movies
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final String path = '/movie/now_playing';
    final Response response = await _getResponse(path, {'page': page});
    return _fromJsonToMovies(response.data);
  }

  // Get Upcoming Movies
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final String path = '/movie/upcoming';
    final Response response = await _getResponse(path, {'page': page});
    return _fromJsonToMovies(response.data);
  }

  // Get Popular Movies
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final String path = '/movie/popular';
    final Response response = await _getResponse(path, {'page': page});
    return _fromJsonToMovies(response.data);
  }

  // Get Upcoming Movies
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final String path = '/movie/top_rated';
    final Response response = await _getResponse(path, {'page': page});
    return _fromJsonToMovies(response.data);
  }

  // Get Movie By Id
  @override
  Future<Movie> getMovieById({required String id}) async {
    final String path = '/movie/$id';
    final Response response = await dio.get(path);

    if (response.statusCode != 200) {
      throw Exception('Movie with id: $id was not found');
    }

    final singleMovie = SingleMovieDetails.fromJson(response.data);
    final Movie movie = MovieMapper.theMovieDbToEntity<SingleMovieDetails>(
      singleMovie,
    );

    return movie;
  }

  // Search Movies
  @override
  Future<List<Movie>> searchMovies(String query) async {
    if (query.isEmpty) return [];

    final String path = '/search/movie';
    final Response response = await _getResponse(path, {'query': query});
    return _fromJsonToMovies(response.data);
  }

  // Methods
  Future<Response> _getResponse(
    String endpoint, [
    Map<String, dynamic>? queryParameters,
  ]) async {
    return await dio.get(endpoint, queryParameters: queryParameters);
  }

  List<Movie> _fromJsonToMovies(Map<String, dynamic> jsonResponse) {
    final TheMovieDbResponse movieDbResponse = TheMovieDbResponse.fromJson(
      jsonResponse,
    );

    // HTTP Conversion to Domain Entity
    final List<Movie> movies = movieDbResponse.results
        // Filter the response in orde to ease the renderization in real-time
        // (Avoids creating Movie objects that do not have poster)
        .where((moviedb) => moviedb.posterPath != 'poster-not-found')
        // The Mapper is implemented instead of using
        // a new instance from the Movie class
        .map(
          (movieDb) =>
              MovieMapper.theMovieDbToEntity<MovieFromTheMovieDB>(movieDb),
        )
        .toList();
    return movies;
  }
}
