import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/providers/storage/favorite_movies_provider.dart';
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

    return Scaffold(
      body: ListView.builder(
        itemCount: favoriteMoviesMap.keys.length,
        itemBuilder: (BuildContext context, int index) {
          final Movie movie = movieList[index];
          return ListTile(title: Text('Nombre de la pelicula: ${movie.title}'));
        },
      ),
    );
  }
}
