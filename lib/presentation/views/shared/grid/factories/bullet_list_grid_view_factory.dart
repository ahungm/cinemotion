import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/views/shared/grid/bullet_list_grid/movie_bullet_list_grid_view.dart';
import 'package:cinemotion/presentation/views/shared/grid/factories/movie_grid_view_factory.dart';
import 'package:cinemotion/presentation/views/shared/grid/movie_grid_view.dart';
import 'package:flutter/material.dart';

class BulletListGridViewFactory implements MovieGridViewFactory {
  @override
  MovieGridView<Movie> create({
    required List<Movie> movies,
    VoidCallback? loadNextPage,
  }) => MovieBulletListGridView(
    movies: movies,
    loadNextPage: loadNextPage,
  );
}
