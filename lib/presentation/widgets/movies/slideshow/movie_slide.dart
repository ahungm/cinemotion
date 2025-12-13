import 'package:cinemotion/domain/entities/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/slideshow/movie_card.dart';
import 'package:flutter/material.dart';

class MovieSlide extends StatelessWidget {
  // Attributes
  final Movie movie;

  // Constructor
  const MovieSlide({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: MovieCard(movie: movie),
    );
  }
}
