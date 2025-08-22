import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../estimation/presentation/pages/input_complaint_screen.dart';
import '../../../home/presentation/pages/home_screen.dart';

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
    const Center(child: Text('Search Page')),
    const Center(child: Text('History Page')),
    const Center(child: Text('Profile Page')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const InputComplaintScreen()),
          );
        },
        backgroundColor: const Color(0xFF74B3CE),
        elevation: 4,
        shape: const CircleBorder(),
        child: const Icon(Iconsax.shop, color: Colors.white, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildNavItem(Iconsax.home, 0),
            _buildNavItem(Iconsax.search_normal, 1),
            const SizedBox(width: 48),
            _buildNavItem(Iconsax.shopping_cart, 2),
            _buildNavItem(Iconsax.user, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final bool isSelected = _selectedIndex == index;
    final Color color = isSelected ? const Color(0xFF74B3CE) : Colors.grey;
    return IconButton(
      icon: Icon(icon, color: color, size: 26),
      onPressed: () => _onItemTapped(index),
    );
  }
}
