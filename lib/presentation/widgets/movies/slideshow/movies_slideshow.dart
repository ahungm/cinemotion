import 'package:cinemotion/domain/entities/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/slideshow/movie_card_swiper.dart';
import 'package:flutter/material.dart';

class MoviesSlideshow extends StatelessWidget {
  // Attributes
  final List<Movie> movies;

  // Constructor
  const MoviesSlideshow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: MovieCardSwiper(movies: movies),
    );
  }
}
