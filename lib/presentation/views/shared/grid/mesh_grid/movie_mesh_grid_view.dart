import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/views/shared/grid/mesh_grid/movie_grid_cell.dart';
import 'package:flutter/material.dart';

class MovieMeshGridView extends StatefulWidget {
  final List<Movie> movies;
  final VoidCallback? loadNextPage;

  const MovieMeshGridView({
    super.key,
    required this.movies,
    required this.loadNextPage,
  });

  @override
  State<MovieMeshGridView> createState() => _MovieMeshGridViewState();
}

class _MovieMeshGridViewState extends State<MovieMeshGridView> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(
      () =>
          (scrollController.position.pixels + 100 >=
              scrollController.position.maxScrollExtent)
          ? widget.loadNextPage!()
          : null,
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
