import 'package:flutter/material.dart';

class MovieTitle extends StatelessWidget {
  final double width;
  final String title;
  final TextStyle? style;

  const MovieTitle({
    super.key,
    required this.width,
    required this.title,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 150,
      child: Center(child: Text(title, maxLines: 2, style: style)),
    );
  }
}
