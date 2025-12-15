// A Carousel will comprehend an Horizontal ListView
// of elements (in this case, movies)

import 'package:cinemotion/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieCarousel extends StatelessWidget {
  // Attributes
  final List<Movie> movies;
  final String? header;
  final String? displayDate;
  final VoidCallback? loadNextPage;

  // Constructor
  const MovieCarousel({
    super.key,
    required this.movies,
    this.header,
    this.displayDate,
    this.loadNextPage,
  });

  // Build Method
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [_Title(title: header, subtitle: displayDate)],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const _Title({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: EdgeInsets.only(top: 10),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          if (title != null) Text(title!, style: titleStyle),
          const Spacer(),
          if (subtitle != null)
            FilledButton.tonal(
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: () {},
              child: Text(subtitle!),
            ),
        ],
      ),
    );
  }
}
