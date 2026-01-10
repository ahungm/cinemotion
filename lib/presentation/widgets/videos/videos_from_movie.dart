import 'package:cinemotion/domain/entities/video/video.dart';
import 'package:cinemotion/presentation/providers/videos/videos_from_movies_provider.dart';
import 'package:cinemotion/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VideosFromMovie extends ConsumerWidget {
  // Attributes
  final int id;

  const VideosFromMovie({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Video>> videosByMovie = ref.watch(
      videosFromMoviesProvider(id),
    );

    // Handle differentes states of an asynchronous operation
    return videosByMovie.when(
      data: (videos) => VideoList(videos: videos),
      error: (_, _) => Center(child: Text('Error al cargar el video')),
      loading: () =>
          const Center(child: CircularProgressIndicator(strokeWidth: 2)),
    );
  }
}
