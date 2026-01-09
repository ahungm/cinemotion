import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/slivers/favorite_button.dart';
import 'package:cinemotion/presentation/widgets/movies/carousel/poster/details/movie_rating.dart';
import 'package:cinemotion/presentation/widgets/movies/carousel/poster/details/movie_views.dart';
import 'package:flutter/material.dart';

class MovieBulletItem extends StatelessWidget {
  final Movie movie;

  const MovieBulletItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(movie.posterPath),
        ),
        const SizedBox(width: 30),
        Text(movie.title),
        const SizedBox(width: 30),
        Column(
          children: [
            MovieRating(color: Colors.amber, rating: movie.voteAverage),
            MovieViews(viewsCount: movie.popularity),
          ],
        ),
        const SizedBox(width: 30),
        FavoriteButton(movie: movie),
      ],
    );
  }
}
