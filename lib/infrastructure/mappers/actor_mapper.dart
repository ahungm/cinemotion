import 'package:cinemotion/domain/entities/actor/actor.dart';
import 'package:cinemotion/infrastructure/models/the-movie-db/credits_response.dart';

class ActorMapper {
  static Actor castToEntity<T extends Cast>(T response) => Actor(
    id: response.id,
    name: response.name,
    profilePath: (response.profilePath != null)
        ? 'https://image.tmdb.org/t/p/w500${response.profilePath}'
        : 'https://www.istockphoto.com/photos/unknown-people',
    role: response.character,
  );
}
