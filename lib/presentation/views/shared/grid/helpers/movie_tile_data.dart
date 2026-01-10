import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/movies/carousel/poster/details/movie_details.dart';

class MovieTileData extends StatelessWidget {
  final Movie movie;

  const MovieTileData({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieRating(
            color: Colors.amber,
            rating: movie.voteAverage,
            iconSize: 18,
          ),
          const SizedBox(height: 5),
          MovieViews(viewsCount: movie.popularity, iconSize: 18),
        ],
      ),
    );
  }
}
