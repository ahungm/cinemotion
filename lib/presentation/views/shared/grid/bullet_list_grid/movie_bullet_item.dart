import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/slivers/favorite_button.dart';
import 'package:cinemotion/presentation/views/shared/grid/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieBulletItem extends StatelessWidget {
  final Movie movie;

  const MovieBulletItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => context.push('/home/0/movie/${movie.id}'),
            child: _buildInnerRow(movie: movie),
          ),
        ),
        const SizedBox(width: 5),
        FavoriteButton(movie: movie, size: 20),
      ],
    );
  }
}

// Inner Methods
Row _buildInnerRow({required Movie movie}) => Row(
  children: [
    MoviePosterGrid(movie: movie),
    const SizedBox(width: 17.5),
    _buildTitle(text: movie.title),
    const SizedBox(width: 15),
    MovieTileData(movie: movie),
  ],
);

Widget _buildTitle({required String text}) =>
    // Wrap the Text in Expanded to prevent horizontal overflow
    Expanded(
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
