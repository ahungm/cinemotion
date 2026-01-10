import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/one_sheet/data/movie_data.dart';
import 'package:cinemotion/presentation/widgets/movies/one_sheet/data/movie_poster_sheet.dart';
import 'package:flutter/material.dart';

class MovieRow extends StatelessWidget {
  final Movie movie;

  const MovieRow({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MoviePosterSheet(movie: movie, size: size),
        const SizedBox(width: 20),
        MovieData(movie: movie, theme: textTheme),
      ],
    );
  }
}
