import 'package:berapaya_fe_flutter/features/authentication/presentation/pages/login_screen.dart';
import 'package:berapaya_fe_flutter/features/profile/presentation/pages/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        centerTitle: true,
        title: Text("Profil",
            style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Iconsax.setting_2, color: theme.colorScheme.onSurface),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SettingsScreen())),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  "https://i.pravatar.cc/150?u=a042581f4e29026704d"),
            ),
            const SizedBox(height: 16),
            Text("Lucyana",
                style: textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold)),
            Text("lucyana@email.com",
                style: textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(Iconsax.logout),
                label: const Text("Keluar"),
                onPressed: () => _showLogoutConfirmationDialog(context, theme),
                style: OutlinedButton.styleFrom(
                  foregroundColor: theme.colorScheme.error,
                  side: BorderSide(
                      color: theme.colorScheme.error.withValues(alpha: 0.5)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context, ThemeData theme) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title:
              Text("Keluar dari Akun Anda", style: theme.textTheme.titleLarge),
          content: Text("Lanjutkan untuk keluar?",
              style: theme.textTheme.bodyMedium),
          actions: <Widget>[
            TextButton(
              child: Text("Batal",
                  style: theme.textTheme.bodyMedium?.copyWith(
                      color:
                          theme.colorScheme.onSurface.withValues(alpha: 0.6))),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("Lanjutkan",
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: theme.colorScheme.error)),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
