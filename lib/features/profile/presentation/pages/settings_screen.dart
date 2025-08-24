import 'package:berapaya_fe_flutter/app/core/providers/theme_provider.dart';
import 'package:berapaya_fe_flutter/features/profile/presentation/pages/edit_profile_screen.dart';
import 'package:berapaya_fe_flutter/features/profile/presentation/pages/notification_setting.dart';
import 'package:berapaya_fe_flutter/features/profile/presentation/pages/tooltip.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../widgets/profile_menu_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        leading: IconButton(
          icon: Icon(Iconsax.arrow_left_2, color: theme.colorScheme.onSurface),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Pengaturan",
            style: theme.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          _buildSectionTitle(context, "Akun"),
          const SizedBox(height: 8),
          _buildMenuCard(context, [
            ProfileMenuItem(
              icon: Iconsax.user_edit,
              title: "Edit Profil",
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditProfileScreen())),
            ),
            ProfileMenuItem(
              icon: Iconsax.notification,
              title: "Notifikasi",
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const EditPengaturanNotifikasiScreen())),
            ),
          ]),
          const SizedBox(height: 24),
          _buildSectionTitle(context, "Aplikasi"),
          const SizedBox(height: 8),
          _buildMenuCard(context, [
            SwitchListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              title: Text("Mode Gelap",
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w500)),
              secondary: Icon(Iconsax.moon, color: theme.colorScheme.tertiary),
              value: themeProvider.themeMode == ThemeMode.dark,
              onChanged: (value) {
                themeProvider
                    .setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
              },
              activeColor: theme.colorScheme.tertiary,
            ),
            ProfileMenuItem(
              icon: Iconsax.support,
              title: "Pusat Bantuan",
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PusatBantuanScreen())),
            ),
          ]),
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

  Widget _buildMenuCard(BuildContext context, List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }
}
