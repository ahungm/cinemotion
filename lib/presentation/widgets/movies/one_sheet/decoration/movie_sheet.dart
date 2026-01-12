import 'package:animate_do/animate_do.dart';
import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/providers/storage/favorite_movies_provider.dart';
import 'package:cinemotion/presentation/widgets/movies/one_sheet/decoration/gradients.dart';
import 'package:cinemotion/presentation/widgets/shared/heart_like.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieSheet extends ConsumerStatefulWidget {
  final Movie movie;

  const MovieSheet({super.key, required this.movie});

  @override
  ConsumerState<MovieSheet> createState() => _MovieSheetState();
}

class _MovieSheetState extends ConsumerState<MovieSheet> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Poster (Background)
        SizedBox.expand(child: _buildMoviePoster(movie: widget.movie)),

        // Top Layer
        Positioned.fill(
          child: GestureDetector(
            // Empty space to touch
            behavior: HitTestBehavior.opaque,
            onDoubleTap: _markAsFavorite,
            // Physical hit area
            child: Container(color: Colors.transparent),
          ),
        ),

        // Ignore by touches so they do not block the detector
        IgnorePointer(
          child: Stack(
            children: [if (isVisible) const HeartLike(), ...gradients],
          ),
        ),
      ],
    );
  }

  void _triggerAnimation() {
    if (!mounted) return;

    // Trigger the visual animation on double tap by making the icon visible
    setState(() => isVisible = true);

    // Hide the animation after the delay
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        setState(() => isVisible = false);
      }
    });
  }

  void _markAsFavorite() async {
    setState(() => isVisible = true);
    _triggerAnimation();
    // Check the current favorite state using the FutureProvider
    // (read used here since this not a build phase)
    ref.read(favoriteMoviesProvider.notifier).markAsFavorite(widget.movie);
  }
}

// Inner Methods
Widget _buildMoviePoster({required Movie movie}) {
  return Image.network(
    movie.posterPath,
    fit: BoxFit.cover,
    loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress != null) return const SizedBox();
      return FadeIn(child: child);
    },
  );
}
