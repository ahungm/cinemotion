import 'package:flutter/material.dart';

class NavigationBarIcon extends StatelessWidget {
  final IconData data;

  const NavigationBarIcon({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    const double marginTop = 1.25;

    return Container(
      margin: EdgeInsets.only(top: marginTop),
      height: 0,
      alignment: Alignment.center,
      child: Icon(data),
    );
  }
}
