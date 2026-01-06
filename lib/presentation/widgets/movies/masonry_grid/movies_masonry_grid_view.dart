import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/masonry_grid/movie_poster_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MoviesMasonryGridView extends StatefulWidget {
  final List<Movie> movies;
  final Future<List<Movie>> Function()? loadNextPage;

  const MoviesMasonryGridView({
    super.key,
    required this.movies,
    this.loadNextPage,
  });

  @override
  State<MoviesMasonryGridView> createState() => _MoviesMasonryGridViewState();
}

class _MoviesMasonryGridViewState extends State<MoviesMasonryGridView> {
  bool isLastPage = false;
  bool isLoading = false;
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: MasonryGridView.count(
        controller: scrollController,
        crossAxisCount: 3,
        mainAxisSpacing: 12.5,
        crossAxisSpacing: 15,
        itemCount: widget.movies.length,
        itemBuilder: (context, index) => (index == 1)
            ? _buildGridSeparation(index)
            : MoviePosterLink(movie: widget.movies[index]),
      ),
    );
  }

  // Inner Methods
  Widget _buildGridSeparation(int index) => Column(
    children: [
      const SizedBox(height: 30),
      MoviePosterLink(movie: widget.movies[index]),
    ],
  );
}
