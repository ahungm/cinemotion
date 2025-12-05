import 'package:cinemotion/constants/environment.dart';
import 'package:cinemotion/domain/datasources/movies_datasource.dart';
import 'package:cinemotion/domain/entities/movie.dart';
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
    final Response response = await dio.get(path);

    // HTTP Conversion to Domain Entity
    final List<Movie> movies = [];
    return movies;
  }
}
