import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/widgets/shared/search_button/searched_movie_details.dart';
import 'package:flutter/material.dart';

class SearchedMovieData extends StatelessWidget {
  final Movie movie;
  final Size size;

  const SearchedMovieData({super.key, required this.movie, required this.size});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: size.width * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [..._buildContent()],
        ),
      ),
    );
  }

  // Inner Methods
  List<Widget> _buildContent() => [
    Text(movie.title, style: TextStyle(fontWeight: FontWeight.bold)),
    const SizedBox(height: 10),
    _buildMovieOverview(movie: movie),
    const SizedBox(height: 10),
    SearchedMovieDetails(movie: movie),
  ];
}

// Methods
Text _buildMovieOverview({required Movie movie}) =>
    (movie.overview.length > 100)
    ? Text(textAlign: TextAlign.start, '${movie.overview.substring(0, 100)}...')
    : Text(movie.overview);
