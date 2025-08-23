import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/profile_menu_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.colorScheme.surfaceContainerHighest,
      appBar: AppBar(
       backgroundColor: theme.colorScheme.surfaceContainerHighest,
        leading: IconButton(
          icon: Icon(Iconsax.arrow_left_2, color: colorScheme.onSurface),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Pengaturan",
          style: textTheme.titleLarge?.copyWith(
              color: colorScheme.onSurface, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          _buildSectionTitle(context, "Akun"),
          const SizedBox(height: 8),
          ProfileMenuItem(
            icon: Iconsax.key,
            title: "Keamanan",
            onTap: () {},
          ),
          ProfileMenuItem(
            icon: Iconsax.notification,
            title: "Notifikasi",
            onTap: () {},
          ),
          const Divider(height: 32),
          _buildSectionTitle(context, "Aplikasi"),
          const SizedBox(height: 8),
          ProfileMenuItem(
            icon: Iconsax.language_square,
            title: "Bahasa",
            onTap: () {},
          ),
          ProfileMenuItem(
            icon: Iconsax.info_circle,
            title: "Tentang Berapaya",
            onTap: () {},
          ),
          const Divider(height: 32),
          ProfileMenuItem(
            icon: Iconsax.logout,
            title: "Keluar",
            textColor: theme.colorScheme.error,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title.toUpperCase(),
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color:
                Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
          ),
    );
  }
}
