import 'package:cinemotion/presentation/widgets/shared/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final StatefulNavigationShell currentChild;

  const HomeScreen({super.key, required this.currentChild});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentChild,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentChild: currentChild,
      ),
    );
  }
}
