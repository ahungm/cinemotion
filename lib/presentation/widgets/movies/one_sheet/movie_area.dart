import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/one_sheet/movie_sheet.dart';
import 'package:flutter/material.dart';

class MovieArea extends StatelessWidget {
  final Movie movie;

  const MovieArea({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      centerTitle: true,
      titlePadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      title: _MovieTitle(title: ''),
      background: MovieSheet(movie: movie),
    );
  }
}

class _MovieTitle extends StatelessWidget {
  final String title;

  const _MovieTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.start,
    );
  }
}
