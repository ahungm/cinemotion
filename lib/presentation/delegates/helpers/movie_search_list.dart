import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/widgets/shared/search_button/movie_search_item.dart';
import 'package:flutter/material.dart';

class MovieSearchList extends StatelessWidget {
  final List<Movie> movies;
  final Function(BuildContext, Movie) moviesCallback;

  const MovieSearchList({
    super.key,
    required this.movies,
    required this.moviesCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return MovieSearchItem(
          movie: movie,
          // Execute the callback correctly
          onMovieSelected: (context, movie) => moviesCallback(context, movie),
        );
      },
    );
  }
}
