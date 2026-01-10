import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/views/shared/grid/mesh_grid/movie_grid_cell.dart';
import 'package:cinemotion/presentation/views/shared/grid/movie_grid_view.dart';
import 'package:flutter/material.dart';

// Strategy implementation

class MovieMeshGridView extends MovieGridView<Movie> {
  const MovieMeshGridView({
    super.key,
    required super.movies,
    super.loadNextPage,
  });

  @override
  State<MovieMeshGridView> createState() => _MovieMeshGridViewState();
}

class _MovieMeshGridViewState
    extends MovieGridViewState<Movie, MovieMeshGridView> {
  @override
  Widget buildGridContent(
    BuildContext context,
    ScrollController scrollController,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.5),
      child: GridView.builder(
        controller: scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 17.5, // Horizontal spacing between items
          mainAxisSpacing: 17.5, // Vertical spacing between items
          childAspectRatio:
              0.75, // The ratio of the width to the height of each item
        ),
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          return MovieGridCell(movie: widget.movies[index]);
        },
      ),
    );
  }
}
