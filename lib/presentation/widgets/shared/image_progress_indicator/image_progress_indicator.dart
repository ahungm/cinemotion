import 'package:cinemotion/presentation/widgets/shared/image_progress_indicator/loading_progress_indicator.dart';
import 'package:flutter/material.dart';

class ImageProgressIndicator extends StatelessWidget {
  final ImageChunkEvent loadingProgress;

  const ImageProgressIndicator({super.key, required this.loadingProgress});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Center(
      heightFactor: size.height * 0.5,
      widthFactor: size.width * 0.5,
      child: LoadingProgressIndicator(loadingProgress: loadingProgress),
    );
  }
}
