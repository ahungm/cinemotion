import 'package:animate_do/animate_do.dart';
import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/widgets/shared/image_progress_indicator/image_progress_indicator.dart';
import 'package:flutter/material.dart';

// Widget class
class MovieBackdropImage extends StatelessWidget {
  // Attributes
  final Movie movie;

  // Constructor
  const MovieBackdropImage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      movie.backdropPath,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) =>
          (loadingProgress != null)
          ? ImageProgressIndicator(loadingProgress: loadingProgress)
          : FadeIn(child: child),
    );
  }
}
