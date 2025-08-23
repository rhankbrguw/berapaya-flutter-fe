import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/category_chip.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // State untuk mengontrol tombol toggle
  final List<bool> _isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "Pencarian",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          _buildToggleButtons(),
          const SizedBox(height: 24),
          _buildSearchBar(),
          const SizedBox(height: 24),
          _buildSectionTitle("Pencarian Terkini"),
          const SizedBox(height: 16),
          _buildRecentSearchItem("Biaya operasi caesar"),
          _buildRecentSearchItem("Rumah Sakit Tipe A di Jabodetabek"),
          const SizedBox(height: 24),
          _buildSectionTitle("Topik Populer"),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12.0,
            runSpacing: 12.0,
            children: [
              CategoryChip(label: "BPJS", onTap: () {}),
              CategoryChip(label: "Biaya Rawat Inap", onTap: () {}),
              CategoryChip(label: "Asuransi Swasta", onTap: () {}),
              CategoryChip(label: "Konsultasi Online", onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButtons() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ToggleButtons(
          isSelected: _isSelected,
          onPressed: (int index) {
            setState(() {
              for (int i = 0; i < _isSelected.length; i++) {
                _isSelected[i] = i == index;
              }
            });
          },
          borderRadius: BorderRadius.circular(20.0),
          selectedColor: Colors.white,
          color: const Color(0xFF004346),
          fillColor: const Color(0xFF74B3CE),
          splashColor: const Color(0xFF74B3CE).withAlpha(50),
          constraints: BoxConstraints.expand(
              width: (constraints.maxWidth / 2) - 2, height: 40),
          children: const [
            Text("Peta RS"),
            Text("Etalase Artikel"),
          ],
        );
      },
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Cari artikel, rumah sakit...",
        hintStyle: TextStyle(color: Colors.grey.shade500),
        prefixIcon: const Icon(Iconsax.search_normal),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF004346)),
    );
  }

  Widget _buildRecentSearchItem(String query) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          const Icon(Iconsax.clock, color: Colors.grey, size: 20),
          const SizedBox(width: 12),
          Expanded(child: Text(query)),
          Icon(Iconsax.close_circle, color: Colors.grey.shade400, size: 20),
        ],
      ),
    );
  }
}
