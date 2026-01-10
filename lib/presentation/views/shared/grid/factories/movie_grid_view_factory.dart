import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/views/shared/grid/movie_grid_view.dart';
import 'package:flutter/material.dart';

/// Abstract Factory interface
abstract class MovieGridViewFactory {
  // Abstract Method
  MovieGridView<Movie> create({
    required List<Movie> movies,
    VoidCallback? loadNextPage,
  });
}
