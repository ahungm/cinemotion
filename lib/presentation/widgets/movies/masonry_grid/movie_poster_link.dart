import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class MoviePosterLink extends StatelessWidget {
  // Attributes
  final Movie movie;

  const MoviePosterLink({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/home/1/movie/${movie.id}'),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          movie.posterPath,
          fit: BoxFit.fill,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return _progressIndicator;
          },
        ),
      ),
    );
  }
}

final Widget _progressIndicator = Container(
  color: Colors.black12, // Placeholder while loading
  child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
);
