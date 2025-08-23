import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../app/core/constants/color_constants.dart';
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
        backgroundColor: AppColors.accentBlue,
        elevation: 4,
        shape: const CircleBorder(),
        child: const Icon(Iconsax.shop, color: AppColors.white, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildNavItem(Iconsax.home, "Home", 0),
            _buildNavItem(Iconsax.search_normal, "Search", 1),
            const SizedBox(width: 48),
            _buildNavItem(Iconsax.clock, "History", 2),
            _buildNavItem(Iconsax.user, "Profile", 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final bool isSelected = _selectedIndex == index;
    final Color color = isSelected ? AppColors.accentBlue : AppColors.grey;

    return InkWell(
      onTap: () => _onItemTapped(index),
      borderRadius: BorderRadius.circular(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 24), // Change this value from 26 to 24
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
