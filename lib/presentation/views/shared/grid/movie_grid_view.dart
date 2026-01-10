import 'package:flutter/material.dart';

abstract class MovieGridView<T> extends StatefulWidget {
  final List<T> movies;
  final VoidCallback? loadNextPage;

  const MovieGridView({super.key, required this.movies, this.loadNextPage});
}

/// Base state class that handles common scroll controller lifecycle

/// Implementation of the strategy pattern
abstract class MovieGridViewState<T, W extends MovieGridView<T>>
    extends State<W> {
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    _setupScrollListener();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  /// Sets up the scroll listener for pagination.

  void _setupScrollListener() {
    if (widget.loadNextPage != null) {
      scrollController.addListener(() {
        if (scrollController.position.pixels + 100 >=
            scrollController.position.maxScrollExtent) {
          widget.loadNextPage!();
        }
      });
    }
  }

  /// Abstract methods
  Widget buildGridContent(
    BuildContext context,
    ScrollController scrollController,
  );

  @override
  Widget build(BuildContext context) {
    return buildGridContent(context, scrollController);
  }
}
