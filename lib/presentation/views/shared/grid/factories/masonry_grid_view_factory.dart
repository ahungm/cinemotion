import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/views/shared/grid/factories/movie_grid_view_factory.dart';
import 'package:cinemotion/presentation/views/shared/grid/masonry_grid/movie_masonry_grid_view.dart';
import 'package:cinemotion/presentation/views/shared/grid/movie_grid_view.dart';
import 'package:flutter/material.dart';

class MasonryGridViewFactory implements MovieGridViewFactory {
  @override
  MovieGridView<Movie> create({
    required List<Movie> movies,
    VoidCallback? loadNextPage,
  }) => MovieMasonryGridView(
    movies: movies,
    loadNextPage: loadNextPage,
  );
}
