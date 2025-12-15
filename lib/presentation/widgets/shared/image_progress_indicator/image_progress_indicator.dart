import 'package:animate_do/animate_do.dart';
import 'package:cinemotion/presentation/widgets/shared/image_progress_indicator/loading_progress_indicator.dart';
import 'package:flutter/material.dart';

// The typedef represents the required signature of a function/method,
// in this case, for the Image.loadingBuilder method
typedef ImageLoadingCallback =
    Widget Function(
      BuildContext context,
      Widget child,
      ImageChunkEvent? loadingProgress,
    );

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

  // Inner Method (Static)
  static ImageLoadingCallback buildImageLoader =
      (context, child, loadingProgress) {
        if (loadingProgress != null) {
          return ImageProgressIndicator(loadingProgress: loadingProgress);
        }
        return FadeIn(child: child);
      };
}
