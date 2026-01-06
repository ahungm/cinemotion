import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/widgets/shared/search_button/searched_movie.dart';
import 'package:flutter/material.dart';

typedef GetSelectedMovieCallback = Function(BuildContext context, Movie movie);

class MovieSearchItem extends StatelessWidget {
  final Movie movie;
  final GetSelectedMovieCallback onMovieSelected;

  const MovieSearchItem({
    super.key,
    required this.movie,
    required this.onMovieSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onMovieSelected(context, movie),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 15, horizontal: 20),
        child: SearchedMovie(movie: movie),
      ),
    );
  }
}
