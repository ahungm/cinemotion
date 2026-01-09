import 'package:flutter/material.dart';

export 'package:cinemotion/presentation/views/shared/grid/helpers/movie_grid_link.dart';
export 'package:cinemotion/presentation/views/shared/grid/helpers/movie_tile_data.dart';
export 'package:cinemotion/presentation/views/shared/grid/helpers/movie_poster_grid.dart';

final List<BoxShadow> shadows = [
  BoxShadow(
    color: Color.fromRGBO(50, 50, 93, 0.25),
    blurRadius: 5,
    spreadRadius: -1,
    offset: Offset(0, 2),
  ),
  BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.3),
    blurRadius: 3,
    spreadRadius: -1,
    offset: Offset(0, 1),
  ),
];
