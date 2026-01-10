import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/widgets/actors/actors_carousel/actors_by_movie_carousel.dart';
import 'package:cinemotion/presentation/widgets/movies/one_sheet/decoration/genre_selector.dart';
import 'package:cinemotion/presentation/widgets/movies/one_sheet/decoration/movie_row.dart';
import 'package:cinemotion/presentation/widgets/movies/related/related_movies.dart';
import 'package:cinemotion/presentation/widgets/videos/videos_from_movie.dart';
import 'package:flutter/material.dart';

class MovieContentDescription extends StatelessWidget {
  final Movie movie;

  const MovieContentDescription({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _buildContent(movie),
    );
  }
}

// Inner Methods
List<Widget> _buildContent(Movie movie) => [
  MovieRow(movie: movie),
  const SizedBox(height: 20),

  // Genre Chips - Wrap handles "infinity" width automatically
  GenreSelector(movie: movie),
  const SizedBox(height: 20),

  ActorsByMovieCarousel(movieId: movie.id.toString()),

  const SizedBox(height: 10),

  VideosFromMovie(id: movie.id),

  const SizedBox(height: 20),

  RelatedMovies(id: movie.id),
  const SizedBox(height: 50),
];
