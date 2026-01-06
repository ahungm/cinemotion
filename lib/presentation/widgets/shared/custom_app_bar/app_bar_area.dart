import 'package:cinemotion/presentation/widgets/shared/custom_app_bar/app_bar_row.dart';
import 'package:flutter/material.dart';

class AppBarArea extends StatelessWidget {
  // Constructor
  const AppBarArea({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: double.infinity, child: AppBarRow());
  }
}
