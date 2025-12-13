import 'package:animate_do/animate_do.dart';
import 'package:cinemotion/domain/entities/movie.dart';
import 'package:cinemotion/presentation/widgets/shared/image_progress_indicator/image_progress_indicator.dart';
import 'package:flutter/material.dart';

// The typedef represents the required signature of a function/method,
// in this case, for the Image.loadingBuilder method

typedef ImageLoadingCallback =
    Widget Function(
      BuildContext context,
      Widget child,
      ImageChunkEvent? loadingProgress,
    );

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
      loadingBuilder: _buildImageLoader,
    );
  }
}

// Methods
ImageLoadingCallback _buildImageLoader = (context, child, loadingProgress) {
  if (loadingProgress != null) {
    return ImageProgressIndicator(loadingProgress: loadingProgress);
  }
  return FadeIn(child: child);
};
