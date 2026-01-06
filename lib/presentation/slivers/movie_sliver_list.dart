import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/one_sheet/movie_description.dart';
import 'package:flutter/material.dart';

class MovieSliverList extends StatelessWidget {
  // Attributes
  final Movie movie;

  // Constructor
  const MovieSliverList({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => MovieDescription(movie: movie),
        childCount: 1,
      ),
    );
  }
}
