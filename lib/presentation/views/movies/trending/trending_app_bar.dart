import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrendingAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  final ValueChanged<int>? onViewChanged;
  final int selectedIndex;

  const TrendingAppBar({
    super.key,
    required this.onViewChanged,
    required this.selectedIndex,
  });

  @override
  ConsumerState<TrendingAppBar> createState() => _TrendingAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _TrendingAppBarState extends ConsumerState<TrendingAppBar> {
  //  State variable
  bool isMenuPressed = false;

  final Text _title = Text(
    'Películas Populares',
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Fixed: changed EdgeInsetsGeometry to EdgeInsets
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ..._changeTrendingViewButtons(),
          const SizedBox(height: 100),
        ],
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
    final ColorScheme colors = Theme.of(context).colorScheme;
    return IconButton(
      onPressed: () => setState(() => isMenuPressed = true),
      icon: const Icon(Icons.menu),
      color: colors.primary,
    );
  }

  Widget _showLayoutOptions() {
    return Row(
      mainAxisSize: MainAxisSize.min, // Prevents the Row from taking full width
      children: _options,
    );
  }

  List<Widget> get _options => [
    _buildLayoutOption(icon: Icons.format_list_bulleted_rounded, index: 0),
    _buildLayoutOption(icon: Icons.dashboard, index: 1),
    _buildLayoutOption(icon: Icons.grid_view_outlined, index: 2),
  ];

  Widget _buildLayoutOption({required IconData icon, required int index}) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return IconButton.filled(
      style: IconButton.styleFrom(
        backgroundColor: widget.selectedIndex == index
            ? colors.secondary
            : Colors.transparent,
      ),
      color: colors.primary,
      onPressed: () => _selectOption(index),
      icon: Icon(
        icon, // Apply color here
      ),
    );
  }

  // Handle the selection and revert the icon
  void _selectOption(int index) {
    setState(() {
      isMenuPressed = false;
    });
    widget.onViewChanged?.call(index);
  }
}
