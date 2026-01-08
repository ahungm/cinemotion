import 'package:cinemotion/presentation/views/movies/trending/trending_app_bar.dart';
import 'package:flutter/material.dart';

class TrendingView extends StatelessWidget {
  const TrendingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: TrendingAppBar(),
        body: Row(children: [Text('Hola')]),
      ),
    );
  }
}
