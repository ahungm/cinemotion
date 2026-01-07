import 'package:cinemotion/domain/entities/actor/actor.dart';
import 'package:cinemotion/presentation/providers/actors/actors_by_movie_provider.dart';
import 'package:cinemotion/presentation/widgets/movies/one_sheet/actors_carousel/horizontal_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActorsByMovieCarousel extends ConsumerWidget {
  final String movieId;

  const ActorsByMovieCarousel({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<String, List<Actor>> actorsByMovie = ref.watch(
      castDetailsProvider,
    );

    if (actorsByMovie[movieId] == null) {
      return const CircularProgressIndicator(strokeWidth: 2);
    }

    final List<Actor> actors = actorsByMovie[movieId]!;

    return SizedBox(height: 300, child: HorizontalScrollView(actors: actors));
  }
}
