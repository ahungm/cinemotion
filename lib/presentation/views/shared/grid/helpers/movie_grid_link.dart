import 'package:flutter/widgets.dart';

class MovieGridLink extends StatelessWidget {
  final String imageUrl;
  final double? borderRadius;
  final double? width;

  const MovieGridLink({
    super.key,
    required this.imageUrl,
    this.borderRadius = 10,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius!),
      child: FadeInImage(
        width: width,
        height: double.infinity,
        fit: BoxFit.cover,
        placeholderFit: BoxFit.scaleDown,
        placeholder: const AssetImage('assets/loaders/film_reel.gif'),
        image: NetworkImage(imageUrl),
      ),
    );
  }
}
