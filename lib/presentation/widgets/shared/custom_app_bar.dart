import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        color: Colors
            .red, // A container is defined to know the space that wraps the widget
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: _AppBarArea(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarArea extends StatelessWidget {
  const _AppBarArea();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          _MovieIcon(),
          const SizedBox(width: 5),
          _AppBarText(),
          const Spacer(), // Allows to define flexible space between elements
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
    );
  }
}

class _MovieIcon extends StatelessWidget {
  const _MovieIcon();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Icon(Icons.movie_creation_outlined, color: colors.primary),
    );
  }
}

class _AppBarText extends StatelessWidget {
  const _AppBarText();

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium;
    final double titleSize = textStyle?.fontSize ?? 26.0;
    const FontWeight fontTitle = FontWeight.bold;

    return Text(
      'Buscador',
      style: (textStyle ?? const TextStyle()).copyWith(
        fontFamily: 'Product-Sans',
        fontSize: titleSize,
        fontWeight: fontTitle,
      ),
    );
  }
}
