import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/views/shared/grid/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieGridCell extends StatelessWidget {
  final Movie movie;

  const MovieGridCell({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      // This pushes the edges of the poster inward,
      // creating a white space area for the shadow to appear
      margin: const EdgeInsets.symmetric(horizontal: 1.5, vertical: 1.5),

      // Apply the BoxShadow to the outside of the frame (container)
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: shadows,
      ),
      child: GestureDetector(
        onTap: () => context.push('/home/0/movie/${movie.id}'),
        child: MovieGridLink(
          imageUrl: movie.posterPath,
          width: double.infinity,
        ),
      ),
    );
  }
}

// Animación con desplazamiento aleatorio de entre 80 a 179 milisegundos

  // final random = Random();

  // // Fade In Up Widget properties:
  // from: random.nextInt(100) + 80,
  // delay: Duration(milliseconds: random.nextInt(450)),