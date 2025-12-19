import 'dart:async';

import 'package:cinemotion/domain/entities/movie.dart';
import 'package:cinemotion/presentation/providers/providers.dart';
import 'package:cinemotion/presentation/providers/shared/date_provider.dart';
import 'package:cinemotion/presentation/widgets/shared/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:cinemotion/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
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
  bool _forceLoading = true;
  Timer? _loadingTimer;

  @override
  void initState() {
    super.initState();

    // Load data
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();

    // Force loading screen for minimum time (e.g., 5 seconds)
    _loadingTimer = Timer(const Duration(milliseconds: 4800), () {
      if (mounted) {
        setState(() {
          _forceLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _loadingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasData =
        ref.watch(popularMoviesProvider).isNotEmpty ||
        ref.watch(nowPlayingMoviesProvider).isNotEmpty ||
        ref.watch(upcomingMoviesProvider).isNotEmpty ||
        ref.watch(topRatedMoviesProvider).isNotEmpty;

    // Show loading if forced OR no data
    if (_forceLoading || !hasData) {
      return const Scaffold(body: FullScreenLoader());
    }

    return Scaffold(
      body: _buildHomeContent(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  Widget _buildHomeContent() {
    final List<Movie> slideshowMovies = ref.watch(movieSlideshowProvider);
    final List<Movie> currentMovies = ref.watch(nowPlayingMoviesProvider);
    final List<Movie> upcomingMovies = ref.watch(upcomingMoviesProvider);
    final List<Movie> topRatedMovies = ref.watch(topRatedMoviesProvider);

    return CustomScrollView(
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
                  mainTitle: 'En Cartelera',
                  displayDate: ref.watch(dateProvider),
                  loadNextPage: () => ref
                      .read(nowPlayingMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                MovieCarousel(
                  movies: upcomingMovies,
                  mainTitle: 'Próximamente',
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
        ),
      ],
    );
  }
}
