import 'package:cinemotion/domain/entities/actor/actor.dart';

abstract class MoviesDatasource {
  Future<List<Actor>> getActorsByMovie({required String movieId});
}
