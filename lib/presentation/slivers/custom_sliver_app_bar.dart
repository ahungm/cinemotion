import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/slivers/favorite_button.dart';
import 'package:cinemotion/presentation/widgets/movies/one_sheet/movie_area.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  final Movie movie;

  const CustomSliverAppBar({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final physicalDeviceSize = MediaQuery.of(context).size;

    return SliverAppBar(
      actions: _buildActions(),
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      expandedHeight: physicalDeviceSize.height * 0.70,
      flexibleSpace: MovieArea(movie: movie),
    );
  }
}

List<Widget>? _buildActions() => [
  // List of associated widgets
  FavoriteButton(),
];
