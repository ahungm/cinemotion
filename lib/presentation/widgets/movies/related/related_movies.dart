import 'package:cinemotion/presentation/providers/movies/related_movies_provider.dart';
import 'package:cinemotion/presentation/widgets/movies/related/suggestions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RelatedMovies extends ConsumerWidget {
  final int id;

  const RelatedMovies({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final similarMovies = ref.watch(relatedMoviesProvider(id));

    return similarMovies.when(
      data: (movies) => Suggestions(movies: movies),
      error: (_, _) =>
          const Center(child: Text('Error al cargar películas similares')),
      loading: () =>
          const Center(child: CircularProgressIndicator(strokeWidth: 2)),
    );
  }
}
