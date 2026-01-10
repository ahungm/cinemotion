// A Carousel will comprehend an Horizontal ListView
// of elements (in this case, movies)

import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/carousel/header/carousel_header.dart';
import 'package:cinemotion/presentation/widgets/movies/carousel/horizontal_list_view.dart';
import 'package:flutter/material.dart';

class MovieCarousel extends StatelessWidget {
  // Attributes
  final List<Movie> movies;
  final String? mainTitle;
  final String? displayDate;
  final VoidCallback? loadNextPage;

  // Constructor
  const MovieCarousel({
    super.key,
    required this.movies,
    this.mainTitle,
    this.displayDate,
    this.loadNextPage,
  });
  // Build Method
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          CarouselHeader(title: mainTitle, subtitle: displayDate),
          Expanded(
            child: SizedBox(
              height: 350,
              child: HorizontalListView(
                movies: movies,
                loadNextPage: loadNextPage,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
