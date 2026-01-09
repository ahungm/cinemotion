import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/providers/providers.dart';
import 'package:cinemotion/presentation/views/movies/trending/trending_app_bar.dart';
import 'package:cinemotion/presentation/views/shared/grid/grids.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrendingView extends ConsumerStatefulWidget {
  const TrendingView({super.key});

  @override
  ConsumerState<TrendingView> createState() => _TrendingViewState();
}

class _TrendingViewState extends ConsumerState<TrendingView> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    ref.read(popularMoviesProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    final List<Movie> popularMovies = ref.watch(popularMoviesProvider);
    return SafeArea(
      child: Scaffold(
        appBar: TrendingAppBar(
          selectedIndex: selectedIndex,
          onViewChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
        body: _buildView(index: selectedIndex, movies: popularMovies),
      ),
    );
  }

  Widget _buildView({required int index, required List<Movie> movies}) {
    switch (index) {
      case 0:
        return MovieBulletListGridView(
          movies: movies,
          loadNextPage: ref.read(popularMoviesProvider.notifier).loadNextPage,
        );
      case 1:
        return MoviesMasonryGridView(
          movies: movies,
          loadNextPage: ref.read(popularMoviesProvider.notifier).loadNextPage,
        );
      case 2:
        return MovieMeshGridView(
          movies: movies,
          loadNextPage: ref.read(popularMoviesProvider.notifier).loadNextPage,
        );
      default:
        return MovieBulletListGridView(
          movies: movies,
          loadNextPage: ref.read(popularMoviesProvider.notifier).loadNextPage,
        );
    }
  }
}
