import 'package:cinemotion/domain/entities/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/carousel/poster/decoration/movie_poster.dart';
import 'package:flutter/material.dart';

class MovieFrame extends StatelessWidget {
  // Attributes
  final List<Movie> movies;

  // Constructor
  const MovieFrame({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: movies.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return MoviePoster(movie: movies[index]);
        },
      ),
    );
  }
}
