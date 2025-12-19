import 'package:cinemotion/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const String name = 'movie-screen';

  // Attributes
  final String movieId;
  // Constructor
  const MovieScreen({super.key, required this.movieId});

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    ref.read(movieInfoProvider.notifier).loadMovie;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String idMovie = ref.watch(movieInfoProvider.notifier).id;

    return Scaffold(appBar: AppBar(title: Text('Movie ID: $idMovie')));
  }
}
