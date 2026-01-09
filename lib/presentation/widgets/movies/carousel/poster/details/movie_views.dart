import 'package:cinemotion/config/helpers/human_readable_format.dart';
import 'package:flutter/material.dart';

class MovieViews extends StatelessWidget {
  final double viewsCount;
  final TextStyle? style;

  const MovieViews({super.key, required this.viewsCount, this.style});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.remove_red_eye_rounded, size: 18),
        const SizedBox(width: 5),
        Text(
          HumanReadableFormat.formatNumber(viewsCount),
          style: style?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
