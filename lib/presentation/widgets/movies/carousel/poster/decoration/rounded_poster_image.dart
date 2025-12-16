import 'package:cinemotion/domain/entities/movie.dart';
import 'package:cinemotion/presentation/widgets/shared/image_progress_indicator/image_progress_indicator.dart';
import 'package:flutter/material.dart';

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
            loadingBuilder: ImageProgressIndicator.buildImageLoader,
          ),
        ),
      ),
    );
  }
}
