import 'package:cinemotion/domain/entities/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/carousel/rounded_poster_image.dart';
import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  // Attributes
  final Movie movie;

  // Constructor
  const MoviePoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 150, child: RoundedPosterImage(movie: movie)),
          SizedBox(height: 5),
          SizedBox(
            height: 32,
            width: 150,
            child: Center(
              child: Text(
                movie.title,
                maxLines: 2,
                style: textStyles.titleSmall,
              ),
            ),
          ),
          Row(
            children: [
              Icon(Icons.star_half_rounded, color: Colors.amberAccent.shade700),
              const SizedBox(width: 4),
              Text(
                '${movie.voteAverage}',
                style: textStyles.bodyMedium?.copyWith(
                  color: Colors.amberAccent.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 30),
              Text(
                '${movie.popularity}',
                style: textStyles.bodySmall?.copyWith(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
