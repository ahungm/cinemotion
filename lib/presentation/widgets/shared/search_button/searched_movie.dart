import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/widgets/shared/search_button/searched_movie_data.dart';
import 'package:cinemotion/presentation/widgets/shared/search_button/searched_movie_poster_image.dart';
import 'package:flutter/material.dart';

class SearchedMovie extends StatelessWidget {
  final Movie movie;

  const SearchedMovie({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SearchedMoviePosterImage(movie: movie, size: size),
        const SizedBox(width: 20),
        SearchedMovieData(movie: movie, size: size),
      ],
    );
  }
}
