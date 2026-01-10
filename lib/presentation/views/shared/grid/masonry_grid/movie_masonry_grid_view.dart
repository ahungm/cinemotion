import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/views/shared/grid/masonry_grid/movie_poster_link.dart';
import 'package:cinemotion/presentation/views/shared/grid/movie_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// Strategy implementation
class MovieMasonryGridView extends MovieGridView<Movie> {
  const MovieMasonryGridView({
    super.key,
    required super.movies,
    super.loadNextPage,
  });

  @override
  State<MovieMasonryGridView> createState() => _MoviesMasonryGridViewState();
}

class _MoviesMasonryGridViewState
    extends MovieGridViewState<Movie, MovieMasonryGridView> {
  @override
  Widget buildGridContent(
    BuildContext context,
    ScrollController scrollController,
  ) {
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
