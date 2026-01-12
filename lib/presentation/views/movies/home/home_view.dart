import 'package:cinemotion/presentation/views/movies/home/home_sliver_app_bar.dart';
import 'package:cinemotion/presentation/views/movies/home/home_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(body: _buildHomeContent());
  }

  Widget _buildHomeContent() {
    return CustomScrollView(slivers: [..._buildSlivers()]);
  }

  List<Widget> _buildSlivers() => const [
    // Widgets
    HomeSliverAppBar(),
    HomeSliverList(),
  ];

  @override
  bool get wantKeepAlive => true;
}
