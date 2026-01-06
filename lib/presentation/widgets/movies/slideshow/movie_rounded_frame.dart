import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/slideshow/movie_backdrop_image.dart';
import 'package:flutter/material.dart';

class MovieRoundedFrame extends StatelessWidget {
  // Attributes
  final Movie movie;

  // Constructor
  const MovieRoundedFrame({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: MovieBackdropImage(movie: movie),
    );
  }
}
