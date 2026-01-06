import 'package:cinemotion/domain/entities/actor/actor.dart';

abstract class ActorsRepository {
  Future<List<Actor>> getActorsByMovie({required String movieId});
}
