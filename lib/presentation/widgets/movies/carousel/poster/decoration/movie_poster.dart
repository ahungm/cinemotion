import 'package:cinemotion/domain/entities/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/carousel/poster/details/poster_details.dart';
import 'package:cinemotion/presentation/widgets/movies/carousel/poster/decoration/movie_title.dart';
import 'package:cinemotion/presentation/widgets/movies/carousel/poster/decoration/rounded_poster_image.dart';
import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  // Attributes
  final Movie movie;

  // Constructor
  const MoviePoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final double posterWidth = 150;
    final textStyles = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RoundedPosterImage(width: posterWidth, movie: movie),
          SizedBox(height: 12.5),
          MovieTitle(
            width: posterWidth,
            title: movie.title,
            style: textStyles.titleSmall,
          ),
          PosterDetails(width: posterWidth, movie: movie, style: textStyles),
        ],
      ),
    );
  }
}
