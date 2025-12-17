import 'package:cinemotion/domain/entities/movie.dart';
import 'package:cinemotion/presentation/providers/providers.dart';
import 'package:cinemotion/presentation/widgets/shared/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:cinemotion/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  // Ruta / Nombre de acceso al componente
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomeView();
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    // Read of the provider to obtain the data
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final List<Movie> currentMovies = ref.watch(nowPlayingMoviesProvider);
    final List<Movie> slideshowMovies = ref.watch(movieSlideshowProvider);
    final List<Movie> popularMovies = ref.watch(popularMoviesProvider);

    if (slideshowMovies.isEmpty) return CircularProgressIndicator();

    return Scaffold(
      body: CustomScrollView(
        // A sliver is a portion of a scrollable area
        // (building block) that allows you to define
        // behavior and effects in a special way
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: EdgeInsets.all(0),
              title: CustomAppBar(),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Column(
                children: [
                  MoviesSlideshow(movies: slideshowMovies),
                  const SizedBox(height: 30),
                  MovieCarousel(
                    movies: currentMovies,
                    mainTitle: 'En Cines',
                    displayDate: 'Lunes 15',
                    loadNextPage: () => ref
                        .read(nowPlayingMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  MovieCarousel(
                    movies: currentMovies,
                    mainTitle: 'Próximamente',
                    loadNextPage: () => ref
                        .read(nowPlayingMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  MovieCarousel(
                    movies: popularMovies,
                    mainTitle: 'Populares',
                    displayDate: 'Este mes',
                    loadNextPage: () => ref
                        .read(nowPlayingMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  MovieCarousel(
                    movies: currentMovies,
                    mainTitle: 'Mejor calificadas',
                    loadNextPage: () => ref
                        .read(nowPlayingMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  const SizedBox(height: 10),
                ],
              );
            }, childCount: 1),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
