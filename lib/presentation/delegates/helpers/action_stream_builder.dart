import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ActionStreamBuilder extends StatelessWidget {
  final Stream<bool> stream;
  final VoidCallback onClearQuery; // Added callback
  final bool isQueryEmpty; // Added flag

  const ActionStreamBuilder({
    super.key,
    required this.stream,
    required this.onClearQuery,
    required this.isQueryEmpty,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: false,
      stream: stream,
      builder: (context, snapshot) {
        final isLoading = snapshot.data ?? false;
        if (isLoading) return _buildLoadingSearchIcon();

        return _buildDeleteSearchIcon(
          onClear: onClearQuery,
          visible: !isQueryEmpty,
        );
      },
    );
  }

  Widget _buildLoadingSearchIcon() => SpinPerfect(
    duration: const Duration(seconds: 2),
    spins: 10,
    infinite: true,
    child: IconButton(
      onPressed: onClearQuery,
      icon: const Icon(Icons.refresh_rounded),
    ),
  );

  Widget _buildDeleteSearchIcon({
    required VoidCallback onClear,
    required bool visible,
  }) => FadeIn(
    animate: visible,
    duration: const Duration(milliseconds: 250),
    child: IconButton(onPressed: onClear, icon: const Icon(Icons.clear)),
  );
}
