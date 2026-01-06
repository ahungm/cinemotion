import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/providers/storage/favorite_movies_provider.dart';
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
    final Color? primaryColor = Theme.of(context).colorScheme.primary;
    final Map<int, Movie> favoriteMoviesMap = ref.watch(favoriteMoviesProvider);

    // Convert the map to a list in order to sweep the elements
    final List<Movie> movieList = favoriteMoviesMap.values.toList();

    if (movieList.isEmpty) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite_border_outlined,
                size: 50,
                color: primaryColor,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Aún no has agregado películas como favoritas',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: MoviesMasonryGridView(
        movies: movieList,
        loadNextPage: ref.read(favoriteMoviesProvider.notifier).loadNextPage,
      ),
    );
  }
}
