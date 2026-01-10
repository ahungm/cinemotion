import 'dart:async';

import 'package:cinemotion/presentation/providers/providers.dart';
import 'package:cinemotion/presentation/views/movies/home/home_sliver_app_bar.dart';
import 'package:cinemotion/presentation/views/movies/home/home_sliver_list.dart';
import 'package:cinemotion/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView>
    with AutomaticKeepAliveClientMixin {
  bool _forceLoading = true;
  Timer? _loadingTimer;

  @override
  void initState() {
    super.initState();

    // Load data
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();

    // Force loading screen for minimum time (e.g., 5 seconds)
    _loadingTimer = Timer(const Duration(milliseconds: 4800), () {
      if (mounted) {
        setState(() {
          _forceLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _loadingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final hasData =
        ref.watch(popularMoviesProvider).isNotEmpty ||
        ref.watch(nowPlayingMoviesProvider).isNotEmpty ||
        ref.watch(upcomingMoviesProvider).isNotEmpty ||
        ref.watch(topRatedMoviesProvider).isNotEmpty;

    // Show loading if forced OR no data
    if (_forceLoading || !hasData) {
      return const Scaffold(body: FullScreenLoader());
    }

    return Scaffold(body: _buildHomeContent());
  }

  Widget _buildHomeContent() {
    return CustomScrollView(slivers: [..._buildSlivers()]);
  }

  List<Widget> _buildSlivers() => const [
    // Widgets
    HomeSliverAppBar(),
    HomeSliverList(),
  ];

  @override
  bool get wantKeepAlive => true;
}
