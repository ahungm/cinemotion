import 'package:cinemotion/config/helpers/human_readable_format.dart';
import 'package:flutter/material.dart';

class MovieRating extends StatelessWidget {
  final Color color;
  final double rating;
  final TextStyle? style;
  final double? iconSize;

  const MovieRating({
    super.key,
    required this.color,
    required this.rating,
    this.style,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _MovieRatingIcon(color: color, size: iconSize),
        const SizedBox(width: 5),
        _MovieVoteRating(voteCount: rating, color: color, style: style),
      ],
    );
  }
}

class _MovieVoteRating extends StatelessWidget {
  final Color color;
  final double voteCount;
  final TextStyle? style;

  const _MovieVoteRating({
    required this.voteCount,
    required this.color,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final defaultStyle = style ?? Theme.of(context).textTheme.bodyMedium;
    return Text(
      HumanReadableFormat.formatNumber(voteCount),
      style: defaultStyle?.copyWith(color: color, fontWeight: FontWeight.bold),
    );
  }
}

class _MovieRatingIcon extends StatelessWidget {
  final Color color;
  final double? size;
  const _MovieRatingIcon({required this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.star_half_rounded, color: color, size: size);
  }
}
