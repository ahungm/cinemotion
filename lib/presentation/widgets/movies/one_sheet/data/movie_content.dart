import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:flutter/material.dart';

class MovieContent extends StatelessWidget {
  final TextTheme style;
  final Movie movie;

  const MovieContent({super.key, required this.movie, required this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      movie.overview,
      textAlign: TextAlign.justify,
      style: style.bodyMedium,
    );
  }
}
