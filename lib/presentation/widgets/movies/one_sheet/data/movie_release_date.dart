import 'package:cinemotion/config/helpers/human_readable_format.dart';
import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:flutter/cupertino.dart';

class MovieReleaseDate extends StatelessWidget {
  final Movie movie;

  const MovieReleaseDate({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Lanzamiento: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 5),
        Text(HumanReadableFormat.shortDate(date: movie.releaseDate)),
      ],
    );
  }
}
