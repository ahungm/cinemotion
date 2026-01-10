import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/one_sheet/data/movie_caption.dart';
import 'package:cinemotion/presentation/widgets/movies/one_sheet/data/movie_content.dart';
import 'package:cinemotion/presentation/widgets/movies/one_sheet/data/movie_release_date.dart';
import 'package:cinemotion/presentation/widgets/movies/one_sheet/decoration/movie_icons.dart';
import 'package:flutter/material.dart';

class MovieData extends StatelessWidget {
  final Movie movie;
  final TextTheme theme;

  const MovieData({super.key, required this.movie, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // Use Expanded to prevent overflow
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildMovieData(movie: movie, texTheme: theme),
      ),
    );
  }
}

// Inner Methods
List<Widget> _buildMovieData({
  required Movie movie,
  required TextTheme texTheme,
}) => [
  MovieCaption(movie: movie, style: texTheme),

  const SizedBox(height: 10),

  MovieIcons(movie: movie),

  const SizedBox(height: 15),

  MovieReleaseDate(movie: movie),

  const SizedBox(height: 15),

  MovieContent(movie: movie, style: texTheme),
];
