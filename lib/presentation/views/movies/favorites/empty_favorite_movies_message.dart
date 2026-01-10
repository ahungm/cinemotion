import 'package:flutter/material.dart';

class EmptyFavoriteMoviesMessage extends StatelessWidget {
  const EmptyFavoriteMoviesMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(children: [..._content]),
    );
  }
}

final List<Widget> _content = [
  _buildText(text: 'Ohh no !!', fontWeight: FontWeight.bold, fontSize: 30),
  const SizedBox(height: 20),
  _buildText(
    text: 'Aún no has agregado películas como favoritas',
    maxLines: 2,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  ),
];

// Inner Methods
Widget _buildText({
  required String text,
  TextAlign? align = TextAlign.center,
  FontWeight? fontWeight,
  double? fontSize,
  Color? fontColor = Colors.blueGrey,
  int? maxLines,
}) => Text(
  text,
  maxLines: maxLines,
  textAlign: align,
  style: TextStyle(
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: fontColor,
  ),
);
