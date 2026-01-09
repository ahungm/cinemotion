import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/providers/providers.dart';
import 'package:cinemotion/presentation/views/movies/trending/trending_app_bar.dart';
import 'package:cinemotion/presentation/views/shared/grid/masonry_grid/movies_masonry_grid_view.dart';
import 'package:cinemotion/presentation/views/shared/grid/mesh_grid/movie_mesh_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrendingView extends ConsumerStatefulWidget {
  const TrendingView({super.key});

  @override
  ConsumerState<TrendingView> createState() => _TrendingViewState();
}

class _TrendingViewState extends ConsumerState<TrendingView> {
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
        appBar: TrendingAppBar(),
        body: MovieMeshGridView(
          movies: popularMovies,
          loadNextPage: ref.read(popularMoviesProvider.notifier).loadNextPage,
        ),
      ),
    );
  }
}

// MoviesMasonryGridView(
//           movies: popularMovies,
//           loadNextPage: ref.read(popularMoviesProvider.notifier).loadNextPage,
//         )
