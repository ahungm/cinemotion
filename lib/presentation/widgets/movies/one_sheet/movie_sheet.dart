import 'package:animate_do/animate_do.dart';
import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/one_sheet/gradients.dart';
import 'package:flutter/material.dart';

class MovieSheet extends StatelessWidget {
  final Movie movie;

  const MovieSheet({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.network(
            movie.posterPath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) return const SizedBox();
              return FadeIn(child: child);
            },
          ),
        ),
        ...gradients,
      ],
    );
  }
}
