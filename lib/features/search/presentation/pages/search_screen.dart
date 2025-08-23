import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        centerTitle: false,
        title: Text(
          "Pencarian",
          style: textTheme.headlineSmall?.copyWith(
              color: colorScheme.onSurface, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          _buildToggleButtons(theme),
          const SizedBox(height: 24),
          _buildSearchBar(theme),
          const SizedBox(height: 24),
          _buildSectionTitle(theme, "Pencarian Terkini"),
          const SizedBox(height: 16),
          _buildRecentSearchItem(theme, "Biaya operasi caesar"),
          _buildRecentSearchItem(theme, "Rumah Sakit Tipe A di Jabodetabek"),
          const SizedBox(height: 24),
          _buildSectionTitle(theme, "Topik Populer"),
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

  Widget _buildToggleButtons(ThemeData theme) {
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
          selectedColor: theme.colorScheme.onPrimary,
          color: theme.colorScheme.primary,
          fillColor: theme.colorScheme.tertiary,
          splashColor: theme.colorScheme.tertiary.withValues(alpha: 0.2),
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

  Widget _buildSearchBar(ThemeData theme) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Cari artikel, rumah sakit...",
        hintStyle: TextStyle(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.4)),
        prefixIcon: Icon(Iconsax.search_normal,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6)),
        filled: true,
        fillColor: theme.scaffoldBackgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.dividerColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.dividerColor),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(ThemeData theme, String title) {
    return Text(
      title,
      style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold, color: theme.colorScheme.primary),
    );
  }

  Widget _buildRecentSearchItem(ThemeData theme, String query) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(Iconsax.clock,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              size: 20),
          const SizedBox(width: 12),
          Expanded(child: Text(query)),
          Icon(Iconsax.close_circle,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              size: 20),
        ],
      ),
    );
  }
}
