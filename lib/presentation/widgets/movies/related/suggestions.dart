import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/carousel/horizontal_list_view.dart';
import 'package:flutter/material.dart';

class Suggestions extends StatelessWidget {
  final List<Movie> movies;

  const Suggestions({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return (movies.isEmpty) ? const SizedBox() : _showRecommendedMovies(movies);
  }
}

Widget _showRecommendedMovies(List<Movie> movies) {
  return Container(
    margin: const EdgeInsetsDirectional.only(bottom: 50),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            textAlign: TextAlign.start,
            'También te puede interesar: ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(height: 300, child: HorizontalListView(movies: movies)),
      ],
    ),
  );
}
