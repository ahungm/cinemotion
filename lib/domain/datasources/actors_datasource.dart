import 'package:cinemotion/domain/entities/actor/actor.dart';

abstract class ActorsDatasource {
  Future<List<Actor>> getActorsByMovie({required String movieId});
}
