import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/views/shared/grid/bullet_list_grid/movie_bullet_item.dart';
import 'package:cinemotion/presentation/views/shared/grid/movie_grid_view.dart';
import 'package:flutter/material.dart';

// Strategy implementation
class MovieBulletListGridView extends MovieGridView<Movie> {
  const MovieBulletListGridView({
    super.key,
    required super.movies,
    super.loadNextPage,
  });

  @override
  State<MovieBulletListGridView> createState() =>
      _MovieBulletListGridViewState();
}

class _MovieBulletListGridViewState
    extends MovieGridViewState<Movie, MovieBulletListGridView> {
  @override
  Widget buildGridContent(
    BuildContext context,
    ScrollController scrollController,
  ) {
    return ListView.builder(
      controller: scrollController,
      itemCount: widget.movies.length,
      itemBuilder: (context, index) {
        return MovieBulletItem(movie: widget.movies[index]);
      },
    );
  }
}
