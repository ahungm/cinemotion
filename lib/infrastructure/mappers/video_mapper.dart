import 'package:cinemotion/infrastructure/models/the-movie-db/helpers/details.dart';

import '../../domain/entities/video/video.dart';

class VideoMapper {
  static Video theMovieDbVideoToEntity(Details details) => Video(
    id: details.id,
    name: details.name,
    youtubeKey: details.youtubeKey,
    publishedAt: details.publishedAt,
  );
}
