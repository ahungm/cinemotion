import 'package:cinemotion/domain/entities/actor/actor.dart';
import 'package:cinemotion/infrastructure/models/the-movie-db/credits_response.dart';

class ActorMapper {
  static Actor castToEntity<T extends Cast>(T response) => Actor(
    id: response.id,
    name: response.name,
    profilePath: _getValidUrlPath(response.profilePath),
    role: response.character,
  );
}

String _getValidUrlPath(String? path) {
  const String defaultImageUrl =
      'https://media.istockphoto.com/id/154956399/photo/anonymous-front-silhouette.jpg?s=612x612&w=0&k=20&c=JpSlXxv688SWY3kwLNtXbPuyWoCeJbW57QTioCS-2XA=';
  const String profileImageUrl = 'https://image.tmdb.org/t/p/w500';

  return (path == null || path.isEmpty || path == 'No-Profile-Image')
      ? defaultImageUrl
      : '$profileImageUrl$path';
}
