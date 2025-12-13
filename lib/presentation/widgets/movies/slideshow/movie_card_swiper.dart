import 'package:card_swiper/card_swiper.dart';
import 'package:cinemotion/domain/entities/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/slideshow/movie_slide.dart';
import 'package:flutter/material.dart';

class MovieCardSwiper extends StatelessWidget {
  // Attributes
  final List<Movie> movies;

  // Constructor
  const MovieCardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Swiper(
      scale: 0.9,
      viewportFraction: 0.85,
      autoplay: true,
      itemCount: movies.length,
      itemBuilder: (context, index) => MovieSlide(movie: movies[index]),
    );
  }
}
