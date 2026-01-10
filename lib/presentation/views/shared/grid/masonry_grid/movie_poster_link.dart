import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../helpers/helpers.dart';

class MoviePosterLink extends StatelessWidget {
  // Attributes
  final Movie movie;

  const MoviePosterLink({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/home/0/movie/${movie.id}'),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 1.5, vertical: 1.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: shadows,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: FadeInImage(
            height: 200,
            fit: BoxFit.cover,
            placeholderFit: BoxFit.contain,
            placeholder: const AssetImage('assets/loaders/film_reel.gif'),
            image: NetworkImage(movie.posterPath),
          ),
        ),
      ),
    );
  }
}
