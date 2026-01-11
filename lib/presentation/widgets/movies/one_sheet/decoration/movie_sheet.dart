import 'package:animate_do/animate_do.dart';
import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/one_sheet/decoration/gradients.dart';
import 'package:flutter/material.dart';

class MovieSheet extends StatefulWidget {
  final Movie movie;

  const MovieSheet({super.key, required this.movie});

  @override
  State<MovieSheet> createState() => _MovieSheetState();
}

class _MovieSheetState extends State<MovieSheet> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. The Poster (Bottom)
        SizedBox.expand(child: _buildMoviePoster(movie: widget.movie)),

        // 2. The FIX: A dedicated interaction layer on TOP of everything
        Positioned.fill(
          child: GestureDetector(
            // We use opaque to ensure the "empty space" is tappable
            behavior: HitTestBehavior.opaque,
            onDoubleTap: _markAsFavorite,
            // We give it a transparent child so it has a physical "hit area"
            child: Container(color: Colors.transparent),
          ),
        ),

        // 3. The Visuals (Ignored by touches so they don't block the detector)
        IgnorePointer(
          child: Stack(
            children: [
              if (isVisible)
                Center(
                  child: ZoomIn(
                    duration: const Duration(milliseconds: 700),
                    child: const Icon(
                      Icons.favorite,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                ),
              ...gradients,
            ],
          ),
        ),
      ],
    );
  }

  void _markAsFavorite() {
    setState(() => isVisible = true);
    Future.delayed(const Duration(milliseconds: 700), () {
      // Check if the widget is still "mounted" before calling setState
      // (Prevents errors if the user leaves the screen before the timer finishes)
      if (mounted) {
        setState(() {
          isVisible = false;
        });
      }
    });
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
