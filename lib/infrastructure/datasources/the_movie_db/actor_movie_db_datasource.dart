import 'package:cinemotion/constants/environment.dart';
import 'package:cinemotion/domain/datasources/actors_datasource.dart';
import 'package:cinemotion/domain/entities/actor/actor.dart';
import 'package:cinemotion/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemotion/infrastructure/models/the-movie-db/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMovieDbDatasource extends ActorsDatasource {
  // Dio Instance
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        //
        'api_key': Environment().apiKey,
        'language': 'es-MX',
      },
    ),
  );

  @override
  Future<List<Actor>> getActorsByMovie({required String movieId}) async {
    final String path = '/movie/$movieId/credits';
    final Response response = await dio.get(path);
    return _fromJsonToActors(response.data);
  }

  List<Actor> _fromJsonToActors(Map<String, dynamic> jsonResponse) {
    final CreditsResponse response = CreditsResponse.fromJson(jsonResponse);

    // HTTP Conversion to Domain Entity
    final List<Actor> actors = response.cast
        .map((actor) => ActorMapper.castToEntity(actor))
        .toList();
    return actors;
  }
}
