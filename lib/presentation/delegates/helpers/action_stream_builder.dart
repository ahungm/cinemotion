import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ActionStreamBuilder extends StatelessWidget {
  final Stream<bool> stream;
  final String query;

  const ActionStreamBuilder({
    super.key,
    required this.stream,
    required this.query,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: false,
      stream: stream,
      builder: (context, snapshot) {
        final isLoading = snapshot.data ?? false;
        return (isLoading)
            ? _buildLoadingSearchIcon(query: query)
            : _buildDeleteSearchIcon(query: query);
      },
    );
  }
}

// Methods
Widget _buildLoadingSearchIcon({required String query}) => SpinPerfect(
  duration: const Duration(seconds: 2),
  spins: 10,
  infinite: true,
  child: IconButton(
    onPressed: () => query = '',
    icon: const Icon(Icons.refresh_rounded),
  ),
);

Widget _buildDeleteSearchIcon({required String query}) => FadeIn(
  animate: query.isNotEmpty,
  duration: const Duration(milliseconds: 250),
  child: IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear)),
);
