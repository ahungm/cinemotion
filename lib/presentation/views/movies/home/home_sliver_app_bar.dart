import 'package:cinemotion/presentation/widgets/shared/custom_app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      flexibleSpace: const FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: CustomAppBar(),
      ),
    );
  }
}
