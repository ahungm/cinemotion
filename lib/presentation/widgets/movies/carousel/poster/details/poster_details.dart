import 'package:cinemotion/domain/entities/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/carousel/poster/details/movie_rating.dart';
import 'package:cinemotion/presentation/widgets/movies/carousel/poster/details/movie_views.dart';
import 'package:flutter/material.dart';

class PosterDetails extends StatelessWidget {
  final double width;
  final Movie movie;
  final TextTheme? style;

  const PosterDetails({
    super.key,
    required this.width,
    required this.movie,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        children: _movieDetails(movie: movie, style: style!),
      ),
    );
  }
}

List<Widget> _movieDetails({required Movie movie, TextTheme? style}) => [
  MovieRating(
    color: Colors.amberAccent.shade700,
    rating: movie.voteAverage,
    style: style!.bodyMedium,
  ),
  const Spacer(),
  MovieViews(viewsCount: movie.popularity, style: style.bodySmall),
];
