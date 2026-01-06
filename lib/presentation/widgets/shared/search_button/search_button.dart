import 'package:cinemotion/presentation/delegates/search_movie_delegate.dart';
import 'package:cinemotion/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/entities/movie/movie.dart';

class SearchButton extends ConsumerWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () => openMovieSearchBar(context, ref),
    );
  }

  static Future<void> openMovieSearchBar(
    BuildContext context,
    WidgetRef ref,
  ) async {
    // Define movieRepository available
    final foundedMovies = ref.read(searchMoviesProvider);
    final searchQuery = ref.read(searchQueryProvider);

    final Movie? movie = await showSearch<Movie?>(
      query: searchQuery,
      context: context,
      delegate: SearchMovieDelegate(
        initialMovies: foundedMovies,
        searchMovies: ref
            .read(searchMoviesProvider.notifier)
            .searchMoviesByQuery,
      ),
    );

    if (!context.mounted) return;

    if (movie != null) {
      context.push('/home/1/movie/${movie.id}');
    }
  }
}

// Is not applied and onTap: () => context.go('/movie/${movie.id.toString()}')
// since is required to perfom several overations; not only navigate in the
// search interface, but to also clean the delagate streams in order to
// show the details of the movie later on (free resources)
