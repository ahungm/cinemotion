import 'package:cinemotion/domain/entities/actor/actor.dart';
import 'package:cinemotion/infrastructure/models/the-movie-db/credits_response.dart';

class ActorMapper {
  static Actor castToEntity<T extends Cast>(T response) => Actor(
    id: response.id,
    name: response.name,
    profilePath: response.profilePath == 'No-Profile-Image'
        ? 'https://www.pngkey.com/png/full/21-213224_unknown-person-icon-png-download.png'
        : (response.profilePath != null && response.profilePath!.isNotEmpty)
        ? 'https://image.tmdb.org/t/p/w500${response.profilePath}'
        : 'https://www.pngkey.com/png/full/21-213224_unknown-person-icon-png-download.png',
    role: response.character,
  );
}
