import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:flutter/material.dart';

class MoviePosterSheet extends StatelessWidget {
  final Size size;
  final Movie movie;

  const MoviePosterSheet({super.key, required this.movie, required this.size});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // Fixed Image Width with rounded corners
      borderRadius: BorderRadius.circular(15), // Fixed: Use BorderRadius
      child: Image.network(
        movie.posterPath,
        width: size.width * 0.3,
        fit: BoxFit.cover,
        // Loading placeholder to prevent layout shifts
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.3,
            height: size.width * 0.45,
            color: Colors.black12,
            child: const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
