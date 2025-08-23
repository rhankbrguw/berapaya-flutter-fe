import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../estimation/presentation/pages/input_complaint_screen.dart';
import '../../../history/presentation/pages/history_screen.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../../../profile/presentation/pages/profile_screen.dart';
import '../../../search/presentation/pages/search_screen.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;
  const MainScreen({super.key, this.initialIndex = 0});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const InputComplaintScreen()),
          );
        },
        backgroundColor: theme.colorScheme.tertiary,
        elevation: 4,
        shape: const CircleBorder(),
        child: Icon(Iconsax.health,
            color: theme.colorScheme.onSecondary, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildNavItem(context, theme, Iconsax.home, "Home", 0),
            _buildNavItem(context, theme, Iconsax.search_normal, "Search", 1),
            const SizedBox(width: 48),
            _buildNavItem(context, theme, Iconsax.clock, "History", 2),
            _buildNavItem(context, theme, Iconsax.user, "Profile", 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, ThemeData theme, IconData icon,
      String label, int index) {
    final bool isSelected = _selectedIndex == index;
    final Color color = isSelected
        ? theme.colorScheme.tertiary
        : theme.colorScheme.onSurface.withValues(alpha: 0.5);

    return Expanded(
      child: InkWell(
        onTap: () => _onItemTapped(index),
        borderRadius: BorderRadius.circular(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(color: color),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
