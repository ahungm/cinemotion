import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:flutter/material.dart';

class MovieCaption extends StatelessWidget {
  final Movie movie;
  final TextTheme style;

  const MovieCaption({super.key, required this.movie, required this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      movie.title,
      style: style.titleLarge?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
