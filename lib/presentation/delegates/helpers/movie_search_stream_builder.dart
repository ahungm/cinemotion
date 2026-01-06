import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/delegates/helpers/loading_search_dots.dart';
import 'package:cinemotion/presentation/delegates/helpers/movie_search_list.dart';
import 'package:flutter/material.dart';

typedef GetStreamCallback = Function(BuildContext context, Movie movie);

class MovieSearchResults extends StatelessWidget {
  final Stream<List<Movie>> stream;
  final List<Movie> initialData;
  final GetStreamCallback onMovieSelected;

  const MovieSearchResults({
    super.key,
    required this.stream,
    required this.initialData,
    required this.onMovieSelected,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Movie>>(
      initialData: initialData,
      stream: stream,
      builder: (context, snapshot) {
        // Show loading dots if we are waiting for the very first piece of data
        if (snapshot.connectionState == ConnectionState.waiting &&
            snapshot.data == null) {
          return const LoadingSearchDots();
        }

        final List<Movie> movies = snapshot.data ?? [];

        // Build the List
        return MovieSearchList(movies: movies, moviesCallback: onMovieSelected);
      },
    );
  }
}
