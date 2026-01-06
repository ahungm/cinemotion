import 'package:cinemotion/presentation/widgets/movies/carousel/header/header_tags.dart';
import 'package:flutter/material.dart';

class CarouselHeader extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const CarouselHeader({super.key, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: HeaderTags(title: title, subtitle: subtitle),
    );
  }
}
