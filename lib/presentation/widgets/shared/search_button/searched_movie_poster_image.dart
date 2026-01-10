import 'package:animate_do/animate_do.dart';
import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:flutter/material.dart';

class SearchedMoviePosterImage extends StatelessWidget {
  final Movie movie;
  final Size size;

  const SearchedMoviePosterImage({
    super.key,
    required this.movie,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.2,
      child: AspectRatio(
        aspectRatio: 2.25 / 4,
        // Rounded Frame
        child: _buildClipRRect(movie),
      ),
    );
  }
}

// Inner Methods
Widget _buildClipRRect(Movie movie) => ClipRRect(
  borderRadius: BorderRadiusGeometry.circular(10),
  child: Image.network(
    movie.posterPath,
    fit: BoxFit.cover,
    loadingBuilder: (context, child, loadingProgress) => FadeIn(child: child),
  ),
);
