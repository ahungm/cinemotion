import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/providers/storage/favorite_movies_provider.dart';
import 'package:cinemotion/presentation/views/movies/favorites/empty_favorite_movie_scaffold.dart';
import 'package:cinemotion/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  ConsumerState<FavoritesView> createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  @override
  void initState() {
    super.initState();
    ref.read(favoriteMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final Map<int, Movie> favoriteMoviesMap = ref.watch(favoriteMoviesProvider);

    // Convert the map to a list in order to sweep the elements
    final List<Movie> movieList = favoriteMoviesMap.values.toList();

    if (movieList.isEmpty) {
      return const EmptyFavoriteMoviesScaffold();
    }

    return Scaffold(
      body: MoviesMasonryGridView(
        movies: movieList,
        loadNextPage: ref.read(favoriteMoviesProvider.notifier).loadNextPage,
      ),
    );
  }
}
