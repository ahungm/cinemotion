import 'package:animate_do/animate_do.dart';
import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/widgets/shared/image_progress_indicator/image_progress_indicator.dart';
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            fit: BoxFit.cover,
            movie.posterPath,
            height: 220,
            width: 150,
            loadingBuilder: (context, child, loadingProgress) =>
                (loadingProgress != null)
                ? ImageProgressIndicator(loadingProgress: loadingProgress)
                : GestureDetector(
                    onTap: () => context.go('/home/1/movie/${movie.id}'),
                    child: FadeIn(child: child),
                  ),
          ),
        ),
      ),
    );
  }
}
