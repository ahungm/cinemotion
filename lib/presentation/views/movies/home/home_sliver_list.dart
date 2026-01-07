import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/providers/providers.dart';
import 'package:cinemotion/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeSliverList extends ConsumerWidget {
  const HomeSliverList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Movie> slideshowMovies = ref.watch(movieSlideshowProvider);
    final List<Movie> currentMovies = ref.watch(nowPlayingMoviesProvider);
    final List<Movie> upcomingMovies = ref.watch(upcomingMoviesProvider);
    final List<Movie> topRatedMovies = ref.watch(topRatedMoviesProvider);

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            MoviesSlideshow(movies: slideshowMovies),
            const SizedBox(height: 30),
            MovieCarousel(
              movies: currentMovies,
              mainTitle: 'En Cartelera',
              displayDate: ref.watch(dateProvider),
              loadNextPage: () =>
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
            ),
            MovieCarousel(
              movies: upcomingMovies,
              mainTitle: 'Próximamente',
              displayDate: 'Este Mes',
              loadNextPage: () =>
                  ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
            ),
            MovieCarousel(
              movies: topRatedMovies,
              mainTitle: 'Mejor calificadas',
              loadNextPage: () =>
                  ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
            ),
            const SizedBox(height: 10),
          ],
        );
      }, childCount: 1),
    );
  }
}
