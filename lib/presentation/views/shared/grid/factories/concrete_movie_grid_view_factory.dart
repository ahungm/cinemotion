import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/views/shared/grid/factories/factories.dart';
import 'package:cinemotion/presentation/views/shared/grid/movie_grid_view.dart';
import 'package:flutter/material.dart';

class ConcreteMovieGridViewFactory {
  ConcreteMovieGridViewFactory._();

  // Concrete factories indexed by view type
  static final List<MovieGridViewFactory> _factories = [
    BulletListGridViewFactory(),
    MasonryGridViewFactory(),
    MeshGridViewFactory(),
  ];

  // Factory method
  static MovieGridView<Movie> create({
    required int index,
    required List<Movie> movies,
    VoidCallback? loadNextPage,
  }) {
    final factoryIndex = index >= 0 && index < _factories.length ? index : 0;
    return _factories[factoryIndex].create(
      movies: movies,
      loadNextPage: loadNextPage,
    );
  }
}
