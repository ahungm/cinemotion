import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/slideshow/movie_slide_decoration.dart';
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
      child: MovieSlideDecoration(movie: movie),
    );
  }
}
