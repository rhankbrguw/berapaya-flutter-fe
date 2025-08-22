import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../widgets/info_card.dart';
import '../widgets/recent_activity_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Recent Activities",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.notification, color: Colors.black54),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Iconsax.setting_2, color: Colors.black54),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const RecentActivityCard(),
          const SizedBox(height: 32),
          const Text(
            "Layout Infografis",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const InfoCard(),
          const InfoCard(),
          const InfoCard(),
          const InfoCard(),
          const InfoCard(),
        ],
      ),
    );
  }
}
