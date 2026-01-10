import 'package:cinemotion/presentation/views/views.dart';
import 'package:cinemotion/presentation/widgets/shared/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const name = 'home-screen';
  final int pageIndex;

  // Constructor
  const HomeScreen({super.key, required this.pageIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// AutomaticKeepAliveClientMixin is necessary to keep the state at
// the time of using the PageView Widget
class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  // Attributes
  late PageController pageController;

  // Init State Method
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 1, keepPage: true);
  }

  @override
  void dispose() {
    super.dispose();
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

    if (pageController.hasClients) {
      _pageTransition();
    }

    return Scaffold(
      // body: IndexedStack(index: widget.pageIndex, children: _viewRoutes),
      body: _buildPage(),
      bottomNavigationBar: CustomBottomNavigationBar(index: widget.pageIndex),
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
