import 'package:cinemotion/domain/entities/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/slideshow/movie_rounded_frame.dart';
import 'package:flutter/material.dart';

class MovieSlideDecoration extends StatelessWidget {
  // Attributes
  final Movie movie;

  // Constructor
  const MovieSlideDecoration({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    // Local variable
    final BoxDecoration decoration = _cardDecoration;

    return DecoratedBox(
      decoration: decoration,
      child: MovieRoundedFrame(movie: movie),
    );
  }
}

// Variables
BoxDecoration _cardDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(25),
  boxShadow: [..._boxShadows],
);

List<BoxShadow> _boxShadows = [
  const BoxShadow(color: Colors.black45, blurRadius: 5, offset: Offset(0, 5)),
];
