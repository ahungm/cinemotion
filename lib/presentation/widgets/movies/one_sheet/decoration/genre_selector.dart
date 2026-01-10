import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/domain/entities/movie/value_objects/genre.dart';
import 'package:flutter/material.dart';

class GenreSelector extends StatelessWidget {
  final Movie movie;

  const GenreSelector({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.start,
      spacing: 15.0, // Space between chips
      runSpacing: 5.0,
      children: movie.genres.map((genre) => _buildChip(genre)).toList(),
    );
  }
}

// Inner Methods
Chip _buildChip(Genre genre) => Chip(
  // We access the name directly from the Genre object inside the Movie
  label: _buildGenreTitle(genre.name),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
);

Text _buildGenreTitle(String text) => Text(
  text,
  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
);
