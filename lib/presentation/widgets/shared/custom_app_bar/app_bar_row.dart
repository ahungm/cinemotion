import 'package:cinemotion/presentation/widgets/shared/custom_app_bar/app_bar_icon.dart';
import 'package:cinemotion/presentation/widgets/shared/custom_app_bar/app_bar_text.dart';
import 'package:cinemotion/presentation/widgets/shared/search_button/search_button.dart';
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
