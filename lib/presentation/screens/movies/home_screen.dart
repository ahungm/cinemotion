import 'package:cinemotion/presentation/views/views.dart';
import 'package:cinemotion/presentation/widgets/shared/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final int pageIndex;

  const HomeScreen({super.key, required this.pageIndex});

  // List Views

  final _viewRoutes = const <Widget>[SizedBox(), HomeView(), FavoritesView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: pageIndex, children: _viewRoutes),
      bottomNavigationBar: CustomBottomNavigationBar(index: pageIndex),
    );
  }
}
