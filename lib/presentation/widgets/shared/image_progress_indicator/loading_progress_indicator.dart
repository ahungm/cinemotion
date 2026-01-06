import 'package:flutter/material.dart';

class LoadingProgressIndicator extends StatelessWidget {
  // Attributes
  final ImageChunkEvent loadingProgress;

  // Constructor
  const LoadingProgressIndicator({super.key, required this.loadingProgress});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: _calculateProgressValue(progress: loadingProgress),
      color: Colors.black12,
    );
  }
}

// Methods
double? _calculateProgressValue({required ImageChunkEvent progress}) =>
    progress.expectedTotalBytes != null ? _calculateRatio(progress) : null;

double? _calculateRatio(ImageChunkEvent progress) {
  return progress.cumulativeBytesLoaded / progress.expectedTotalBytes!;
}
