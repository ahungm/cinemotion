import 'package:cinemotion/domain/entities/actor/actor.dart';
import 'package:cinemotion/presentation/providers/actors/actors_by_movie_provider.dart';
import 'package:cinemotion/presentation/widgets/movies/one_sheet/genre_selector.dart';
import 'package:cinemotion/presentation/widgets/movies/one_sheet/movie_data.dart';
import 'package:cinemotion/presentation/widgets/movies/one_sheet/movie_poster_sheet.dart';
import 'package:flutter/material.dart';
import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDescription extends StatelessWidget {
  final Movie movie;

  const MovieDescription({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    // Using a ScrollView is safer here because movie descriptions can vary in length
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: _ContentDescription(movie: movie),
      ),
    );
  }
}

class _ContentDescription extends StatelessWidget {
  final Movie movie;

  const _ContentDescription({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MoviePosterSheet(movie: movie, size: size),
            const SizedBox(width: 20),
            MovieData(movie: movie, theme: textTheme),
          ],
        ),

        const SizedBox(height: 20),

        // Genre Chips - Wrap handles "infinity" width automatically
        GenreSelector(movie: movie),

        const SizedBox(height: 20),

        ActorsByMovieCarousel(movieId: movie.id.toString()),

        const SizedBox(height: 50),
      ],
    );
  }
}

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

    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: actors.length,
        itemBuilder: (context, index) {
          final actor = actors[index];
          return Container(
            padding: EdgeInsets.all(10),
            width: 135,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    actor.profilePath,
                    height: 200,
                    width: 135,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 5),
                Text(actor.name, maxLines: 2),
                SizedBox(height: 10),
                Expanded(
                  child: Text(
                    actor.role ?? '',
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
