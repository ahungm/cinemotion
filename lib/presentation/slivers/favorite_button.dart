import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/providers/storage/favorite_movies_provider.dart';
import 'package:cinemotion/presentation/providers/storage/is_favorite_movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteButton extends ConsumerWidget {
  final Movie movie;

  const FavoriteButton({super.key, required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkFavoriteFuture = ref.watch(isFavoriteMovieProvider(movie.id));

    return IconButton(
      onPressed: () async {
        await ref
            .read(favoriteMoviesProvider.notifier)
            .toggleFavoriteMovie(movie);
        ref.invalidate(
          isFavoriteMovieProvider,
        ); // Avoid using autoDispose in the FutureProvider (only use this latter option if it is not necessary to keep the state after quit from the screen)
      },
      padding: const EdgeInsets.symmetric(horizontal: 20),
      iconSize: 40,
      icon: checkFavoriteFuture.when(
        data: (isFavorite) => _displayFavoriteState(isFavorite),
        error: (_, _) =>
            throw Exception('Error al cargar el estado de favoritos'),
        loading: () => const CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }
}

Widget _displayFavoriteState(bool state) => state
    ? const Icon(Icons.favorite, color: Colors.redAccent)
    : const Icon(Icons.favorite_border_outlined);
