import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/views/shared/grid/factories/movie_grid_view_factory.dart';
import 'package:cinemotion/presentation/views/shared/grid/grids.dart';

import 'package:flutter/material.dart';

class MeshGridViewFactory implements MovieGridViewFactory {
  @override
  MovieGridView<Movie> create({
    required List<Movie> movies,
    VoidCallback? loadNextPage,
  }) => MovieMeshGridView(
    movies: movies,
    loadNextPage: loadNextPage,
  );
}
