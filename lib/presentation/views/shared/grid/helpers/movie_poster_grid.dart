import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:flutter/material.dart';

import 'helpers.dart';

class MoviePosterGrid extends StatelessWidget {
  final Movie movie;

  const MoviePosterGrid({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 100,
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: shadows,
        ),
        child: MovieGridLink(imageUrl: movie.posterPath, borderRadius: 5),
      ),
    );
  }
}
