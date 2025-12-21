import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/carousel/poster/details/movie_rating.dart';
import 'package:cinemotion/presentation/widgets/movies/carousel/poster/details/movie_views.dart';
import 'package:flutter/material.dart';

class MovieIcons extends StatelessWidget {
  final Movie movie;

  const MovieIcons({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MovieRating(color: Colors.amber, rating: movie.voteAverage),
        const SizedBox(width: 15),
        const Icon(Icons.remove_red_eye_rounded, size: 18),
        const SizedBox(width: 5),
        MovieViews(viewsCount: movie.popularity),
      ],
    );
  }
}
