import 'package:cinemotion/presentation/delegates/search_movie_delegate.dart';
import 'package:cinemotion/presentation/widgets/shared/custom_app_bar/app_bar_icon.dart';
import 'package:cinemotion/presentation/widgets/shared/custom_app_bar/app_bar_text.dart';
import 'package:flutter/material.dart';

class AppBarRow extends StatelessWidget {
  // Constructor
  const AppBarRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [...appBarElements]);
  }
}

List<Widget> appBarElements = [
  const AppBarIcon(),
  const SizedBox(width: 5),
  const AppBarText(),
  const Spacer(), // Allows to define flexible space between elements
  const SearchButton(),
];

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showSearch(context: context, delegate: SearchMovieDelegate());
      },
      icon: Icon(Icons.search),
    );
  }
}
