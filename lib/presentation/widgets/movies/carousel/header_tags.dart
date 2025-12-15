import 'package:cinemotion/presentation/widgets/movies/carousel/tonal_text_button.dart';
import 'package:flutter/material.dart';

class HeaderTags extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const HeaderTags({super.key, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Row(
      children: _buildHeader(
        title: title,
        subtitle: subtitle,
        textStyle: titleStyle,
      ),
    );
  }
}

// Methods
List<Widget> _buildHeader({
  String? title,
  String? subtitle,
  TextStyle? textStyle,
}) {
  final List<Widget> titles = [];
  if (title != null) titles.add(Text(title, style: textStyle));
  titles.add(const Spacer());
  if (subtitle != null) titles.add(TonalTextButton(text: subtitle));
  return titles;
}
