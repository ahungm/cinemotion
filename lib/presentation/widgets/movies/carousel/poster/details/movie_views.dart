import 'package:cinemotion/config/helpers/human_readable_format.dart';
import 'package:flutter/material.dart';

class MovieViews extends StatelessWidget {
  final double viewsCount;
  final TextStyle? style;
  final double? iconSize;

  const MovieViews({
    super.key,
    required this.viewsCount,
    this.style,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.remove_red_eye_rounded, size: iconSize),
        const SizedBox(width: 5),
        Text(
          HumanReadableFormat.formatNumber(viewsCount),
          style: style?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
