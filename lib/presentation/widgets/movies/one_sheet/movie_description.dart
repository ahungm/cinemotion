import 'package:flutter/material.dart';
import 'package:cinemotion/domain/entities/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/carousel/poster/details/movie_rating.dart';
import 'package:cinemotion/presentation/widgets/movies/carousel/poster/details/movie_views.dart';

class MovieDescription extends StatelessWidget {
  final Movie movie;

  const MovieDescription({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    // Using a ScrollView is safer here because movie descriptions can vary in length
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: _ContentDescription(movie: movie),
      ),
    );
  }
}

class _ContentDescription extends StatelessWidget {
  final Movie movie;

  const _ContentDescription({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fixed Image Width with rounded corners
            ClipRRect(
              borderRadius: BorderRadius.circular(
                20,
              ), // Fixed: Use BorderRadius
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
            ),

            const SizedBox(width: 20),

            // Use Expanded instead of hardcoded math to prevent overflow
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      MovieRating(
                        color: Colors.amber,
                        rating: movie.voteAverage,
                      ),
                      const SizedBox(width: 15),
                      const Icon(Icons.remove_red_eye_rounded, size: 18),
                      const SizedBox(width: 5),
                      MovieViews(viewsCount: movie.popularity),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    movie.overview,
                    textAlign: TextAlign.justify,
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        // Genre Chips - Wrap handles "infinity" width automatically
        Wrap(
          spacing: 8.0, // Space between chips
          runSpacing: 10.0, // Space between lines
          children: movie.genreIds
              .map(
                (genre) => Chip(
                  label: Text(genre, style: const TextStyle(fontSize: 12)),
                  visualDensity: VisualDensity.compact,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ), // Fixed: Use BorderRadius
                  ),
                ),
              )
              .toList(),
        ),

        const SizedBox(height: 50),
      ],
    );
  }
}
