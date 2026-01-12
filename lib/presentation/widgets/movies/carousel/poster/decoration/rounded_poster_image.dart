import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoundedPosterImage extends StatelessWidget {
  // Attributes
  final double width;
  final Movie movie;

  const RoundedPosterImage({
    super.key,
    required this.width,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: AspectRatio(
        aspectRatio: 2.75 / 4,
        child: SizedBox(
          width: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: GestureDetector(
              onTap: () => context.push('/home/1/movie/${movie.id}'),
              child: FadeInImage(
                height: 220,
                fit: BoxFit.cover,
                placeholderFit: BoxFit.contain,
                placeholder: const AssetImage('assets/loaders/film_reel.gif'),
                image: NetworkImage(movie.posterPath),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
