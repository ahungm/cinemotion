import 'package:cinemotion/presentation/widgets/movies/one_sheet/data/movie_content_description.dart';
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
        child: MovieContentDescription(movie: movie),
      ),
    );
  }
}
