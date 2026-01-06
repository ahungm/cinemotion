import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/one_sheet/movie_caption.dart';
import 'package:cinemotion/presentation/widgets/movies/one_sheet/movie_content.dart';
import 'package:cinemotion/presentation/widgets/movies/one_sheet/movie_icons.dart';
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
        children: [
          MovieCaption(movie: movie, style: theme),
          const SizedBox(height: 10),
          MovieIcons(movie: movie),
          const SizedBox(height: 15),
          MovieContent(movie: movie, style: theme),
        ],
      ),
    );
  }
}
