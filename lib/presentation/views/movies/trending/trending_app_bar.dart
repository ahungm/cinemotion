import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrendingAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const TrendingAppBar({super.key});

  @override
  ConsumerState<TrendingAppBar> createState() => _TrendingAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _TrendingAppBarState extends ConsumerState<TrendingAppBar> {
  //  State variable
  bool isMenuPressed = false;

  final Text _title = Text(
    'Popular Movies',
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Fixed: changed EdgeInsetsGeometry to EdgeInsets
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: _changeTrendingViewButtons(),
      ),
    );
  }

  List<Widget> _changeTrendingViewButtons() {
    return [
      Padding(padding: EdgeInsets.symmetric(horizontal: 15), child: _title),
      const Spacer(),
      // Logic to open the Menu depending when it is pressed or not
      isMenuPressed ? _showLayoutOptions() : _buildLayoutButton(),
    ];
  }

  // Inner Methods
  Widget _buildLayoutButton() {
    return IconButton(
      onPressed: () => setState(() => isMenuPressed = true),
      icon: const Icon(Icons.menu),
    );
  }

  Widget _showLayoutOptions() {
    return Row(
      mainAxisSize: MainAxisSize.min, // Prevents the Row from taking full width
      children: _options,
    );
  }

  List<Widget> get _options => [
    _buildLayoutOption(icon: Icons.format_list_bulleted_rounded),
    _buildLayoutOption(icon: Icons.dashboard),
    _buildLayoutOption(icon: Icons.grid_view_outlined),
  ];

  Widget _buildLayoutOption({required IconData icon}) {
    return IconButton(onPressed: () => _selectOption(), icon: Icon(icon));
  }

  // Handle the selection and revert the icon
  void _selectOption() {
    setState(() {
      isMenuPressed = false;
    });
  }
}
