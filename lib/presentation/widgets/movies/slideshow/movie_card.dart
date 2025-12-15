import 'package:cinemotion/domain/entities/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/slideshow/movie_slide.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  // Attributes
  final Movie movie;

  // Constructor
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: MovieSlide(movie: movie),
    );
  }
}
