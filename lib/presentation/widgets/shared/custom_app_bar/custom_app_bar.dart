import 'package:cinemotion/presentation/widgets/shared/custom_app_bar/app_bar_area.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // Constructor
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      bottom: false,
      child: Padding(
        // color: Colors.red, // A container is defined to know the space that wraps the widget
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: AppBarArea(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
