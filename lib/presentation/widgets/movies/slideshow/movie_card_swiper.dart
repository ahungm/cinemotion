import 'package:card_swiper/card_swiper.dart';
import 'package:cinemotion/domain/entities/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/slideshow/movie_card.dart';
import 'package:flutter/material.dart';

class MovieCardSwiper extends StatelessWidget {
  // Attributes
  final List<Movie> movies;

  // Constructor
  const MovieCardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Swiper(
      scale: 0.9,
      viewportFraction: 0.85,
      autoplay: true,
      pagination: _buildSwiperPagination(colors: colors),
      itemCount: movies.length,
      itemBuilder: (context, index) => MovieCard(movie: movies[index]),
    );
  }
}

SwiperPlugin? _buildSwiperPagination({required ColorScheme colors}) =>
    SwiperPagination(
      alignment: Alignment(0, 1.25),
      margin: EdgeInsets.only(top: 0),
      builder: DotSwiperPaginationBuilder(
        activeColor: colors.primary,
        color: colors.secondary,
      ),
    );
