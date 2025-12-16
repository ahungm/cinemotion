import 'package:flutter/material.dart';

class TonalTextButton extends StatelessWidget {
  final String? text;

  const TonalTextButton({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      style: const ButtonStyle(visualDensity: VisualDensity.compact),
      onPressed: () {},
      child: Text(text!),
    );
  }
}
