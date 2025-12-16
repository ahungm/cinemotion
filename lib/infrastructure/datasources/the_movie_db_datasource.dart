import 'package:cinemotion/constants/environment.dart';
import 'package:cinemotion/domain/datasources/movies_datasource.dart';
import 'package:cinemotion/domain/entities/movie.dart';
import 'package:cinemotion/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemotion/infrastructure/models/the-movie-db/the_movie_db_response_dto.dart';
import 'package:dio/dio.dart';

// Datasource created to manage all the interactions with
// The Movie DB API
class TheMovieDbDatasource implements MoviesDatasource {
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

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final String path = '/movie/now_playing';
    final Response response = await dio.get(
      path,
      queryParameters: {'page': page},
    );

    final TheMovieDbResponse movieDbResponse = TheMovieDbResponse.fromJson(
      response.data,
    );

    // HTTP Conversion to Domain Entity
    final List<Movie> movies = movieDbResponse.results
        // Filter the response in orde to ease the renderization in real-time
        // (Avoids creating Movie objects that do not have poster)
        .where((moviedb) => moviedb.posterPath != 'poster-not-found')
        // The Mapper is implemented instead of using
        // a new instance from the Movie class
        .map((movieDb) => MovieMapper.theMovieDBToEntity(movieDb))
        .toList();
    return movies;
  }
}
