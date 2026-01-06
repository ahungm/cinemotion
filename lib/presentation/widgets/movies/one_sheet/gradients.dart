import 'package:flutter/material.dart';

List<Widget> gradients = [
  _GradientEffect(
    shadowValues: [0.7, 1.0],
    colors: [Colors.transparent, Colors.black87],
  ),
  _GradientEffect(
    beginOrientation: Alignment.topLeft,
    endOrientation: Alignment.topRight,
    shadowValues: [0.0, 0.5],
    colors: [Colors.black26, Colors.transparent],
  ),
  _GradientEffect(
    beginOrientation: Alignment.topRight,
    endOrientation: Alignment.bottomLeft,
    shadowValues: [0.0, 0.4],
    colors: [Colors.black87, Colors.transparent],
  ),
];

class _GradientEffect extends StatelessWidget {
  final AlignmentGeometry beginOrientation;
  final AlignmentGeometry endOrientation;
  final List<double> shadowValues;
  final List<Color> colors;

  const _GradientEffect({
    this.beginOrientation = Alignment.topCenter,
    this.endOrientation = Alignment.bottomCenter,
    required this.shadowValues,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: beginOrientation,
            end: endOrientation,
            stops: shadowValues, // Begin - End percentage of the gradient
            colors: colors,
          ),
        ),
      ),
    );
  }
}
