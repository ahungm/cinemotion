import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/one_sheet/decoration/gradients.dart';
import 'package:cinemotion/presentation/widgets/movies/one_sheet/decoration/movie_sheet.dart';
import 'package:flutter/material.dart';

class MovieArea extends StatelessWidget {
  final Movie movie;

  const MovieArea({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return FlexibleSpaceBar(
      titlePadding: const EdgeInsets.only(bottom: 0),
      centerTitle: true,
      background: Stack(
        fit: StackFit.expand,
        children: [
          // Move the overlay before the sheet background so it is behind it
          _buildGradientOverlay(scaffoldColor: scaffoldBackgroundColor),
          MovieSheet(movie: movie),
        ],
      ),
    );
  }
}

// Inner Methods
Widget _buildGradientOverlay({required Color scaffoldColor}) {
  return GradientEffect(
    beginOrientation: Alignment.topCenter,
    endOrientation: Alignment.bottomCenter,
    shadowValues: const [0.7, 1.0],
    colors: [Colors.transparent, scaffoldColor],
  );
}
