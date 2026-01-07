import 'package:cinemotion/presentation/views/views.dart';
import 'package:cinemotion/presentation/widgets/shared/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final int pageIndex;

  const HomeScreen({super.key, required this.pageIndex});

  // Routes of the views
  final _viewRoutes = const <Widget>[
    TrendingView(),
    HomeView(),
    FavoritesView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: pageIndex, children: _viewRoutes),
      bottomNavigationBar: CustomBottomNavigationBar(index: pageIndex),
    );
  }
}
