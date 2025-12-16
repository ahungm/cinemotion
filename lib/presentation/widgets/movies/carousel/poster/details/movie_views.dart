import 'package:cinemotion/config/helpers/human_readable_format.dart';
import 'package:flutter/material.dart';

class MovieViews extends StatelessWidget {
  final double viewsCount;
  final TextStyle? style;

  const MovieViews({super.key, required this.viewsCount, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      HumanReadableFormat.formatNumber(viewsCount),
      style: style?.copyWith(
        color: Colors.black54,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
