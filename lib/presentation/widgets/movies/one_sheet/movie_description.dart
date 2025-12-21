import 'package:cinemotion/presentation/widgets/movies/one_sheet/genre_selector.dart';
import 'package:cinemotion/presentation/widgets/movies/one_sheet/movie_data.dart';
import 'package:cinemotion/presentation/widgets/movies/one_sheet/movie_poster_sheet.dart';
import 'package:flutter/material.dart';
import 'package:cinemotion/domain/entities/movie/movie.dart';

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
            MoviePosterSheet(movie: movie, size: size),
            const SizedBox(width: 20),
            MovieData(movie: movie, theme: textTheme),
          ],
        ),

        const SizedBox(height: 20),

        // Genre Chips - Wrap handles "infinity" width automatically
        GenreSelector(movie: movie),

        const SizedBox(height: 50),
      ],
    );
  }
}
