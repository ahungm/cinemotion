import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:flutter/material.dart';

class GenreSelector extends StatelessWidget {
  final Movie movie;

  const GenreSelector({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 15.0, // Space between chips
      runSpacing: 5.0,
      children: movie.genres
          .map(
            (genre) => Chip(
              // We access the name directly from the Genre object inside the Movie
              label: Text(
                genre.name,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          )
          .toList(),
    );
  }
}
