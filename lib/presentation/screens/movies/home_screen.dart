import 'dart:async';

import 'package:cinemotion/presentation/views/views.dart';
import 'package:cinemotion/presentation/widgets/shared/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:cinemotion/presentation/widgets/shared/full_screen_loader/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/movies/movies_providers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const name = 'home-screen';
  final int pageIndex;

  // Constructor
  const HomeScreen({super.key, required this.pageIndex});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

// AutomaticKeepAliveClientMixin is necessary to keep the state at
// the time of using the PageView Widget
class _HomeScreenState extends ConsumerState<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  // Attributes
  late PageController pageController;
  bool _forceLoading = true;
  Timer? _loadingTimer;

  // Init State Method
  @override
  void initState() {
    super.initState();
    // Load data
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();

    // Initial index of the controller
    pageController = PageController(initialPage: 1, keepPage: true);

    // Force loading screen for minimum time (aprox. 5 seconds)
    _loadingTimer = Timer(const Duration(milliseconds: 4800), () {
      if (mounted) {
        setState(() => _forceLoading = false);
      }
    });

    pageController = PageController(initialPage: 1, keepPage: true);
  }

  @override
  void dispose() {
    super.dispose();
    _loadingTimer?.cancel();
    pageController.dispose();
  }

  // Routes of the views
  final _viewRoutes = const <Widget>[
    TrendingView(),
    HomeView(),
    FavoritesView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final hasData =
        ref.watch(popularMoviesProvider).isNotEmpty ||
        ref.watch(nowPlayingMoviesProvider).isNotEmpty ||
        ref.watch(upcomingMoviesProvider).isNotEmpty ||
        ref.watch(topRatedMoviesProvider).isNotEmpty;

    // Show loading if forced or there is still no data loaded
    if (_forceLoading || !hasData) {
      return const Scaffold(body: FullScreenLoader());
    }

    if (pageController.hasClients) {
      _pageTransition();
    }

    return Scaffold(
      // body: IndexedStack(index: widget.pageIndex, children: _viewRoutes),
      body: _buildPage(),
      bottomNavigationBar: Visibility(
        visible: !_forceLoading,
        child: CustomBottomNavigationBar(index: widget.pageIndex),
      ),
    );
  }

  // Inner Methods
  Future<void> _pageTransition() async {
    pageController.animateToPage(
      widget.pageIndex,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildPage() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(), // Avoid bouncing effect
      controller: pageController,
      children: _viewRoutes,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
