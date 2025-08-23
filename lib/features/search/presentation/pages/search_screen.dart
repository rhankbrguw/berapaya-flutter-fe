import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../app/core/constants/color_constants.dart';
import '../widgets/category_chip.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<bool> _isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Pencarian",
          style: textTheme.headlineSmall?.copyWith(
              color: colorScheme.onSurface, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          _buildToggleButtons(),
          const SizedBox(height: 24),
          _buildSearchBar(context),
          const SizedBox(height: 24),
          _buildSectionTitle(context, "Pencarian Terkini"),
          const SizedBox(height: 16),
          _buildRecentSearchItem("Biaya operasi caesar"),
          _buildRecentSearchItem("Rumah Sakit Tipe A di Jabodetabek"),
          const SizedBox(height: 24),
          _buildSectionTitle(context, "Topik Populer"),
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
          selectedColor: AppColors.white,
          color: AppColors.primaryDarkGreen,
          fillColor: AppColors.accentBlue,
          splashColor: AppColors.accentBlue.withAlpha(51),
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

  Widget _buildSearchBar(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Cari artikel, rumah sakit...",
        hintStyle: const TextStyle(color: AppColors.grey),
        prefixIcon: const Icon(Iconsax.search_normal),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold, color: AppColors.primaryDarkGreen),
    );
  }

  Widget _buildRecentSearchItem(String query) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          const Icon(Iconsax.clock, color: AppColors.grey, size: 20),
          const SizedBox(width: 12),
          Expanded(child: Text(query)),
          const Icon(Iconsax.close_circle, color: AppColors.grey, size: 20),
        ],
      ),
    );
  }
}
