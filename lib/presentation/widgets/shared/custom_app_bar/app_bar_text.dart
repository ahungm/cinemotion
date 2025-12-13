import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  // Constructor
  const AppBarText({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium;
    final double titleSize = textStyle?.fontSize ?? 26.0;
    const FontWeight fontTitle = FontWeight.bold;

    return Text(
      'Cinemotion',
      style: (textStyle ?? const TextStyle()).copyWith(
        fontFamily: 'Product-Sans',
        fontSize: titleSize,
        fontWeight: fontTitle,
      ),
    );
  }
}
