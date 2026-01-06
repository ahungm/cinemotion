import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';

class LoadingSearchDots extends StatelessWidget {
  const LoadingSearchDots({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Center(
      child: JumpingDots(
        color: colors.primary,
        innerPadding: 5,
        radius: 10,
        numberOfDots: 3,
        animationDuration: const Duration(milliseconds: 200),
      ),
    );
  }
}
