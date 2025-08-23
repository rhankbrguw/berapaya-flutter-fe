import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../authentication/presentation/pages/login_screen.dart';
import '../widgets/profile_menu_item.dart';
import 'edit_profile_screen.dart';
import 'notification_setting.dart';
import 'tooltip.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Profil",
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                "https://placehold.co/100x100/74B3CE/FFFFFF?text=L",
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Lucyana",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            Text(
              "lucyana@email.com",
              style: TextStyle(
                color: theme.colorScheme.outline,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 32),
            _buildMenuGroup(context, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuGroup(BuildContext context, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ProfileMenuItem(
            icon: Iconsax.user_edit,
            title: "Edit Profil",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfileScreen(),
                ),
              );
            },
          ),
          ProfileMenuItem(
            icon: Iconsax.notification,
            title: "Pengaturan Notifikasi",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditPengaturanNotifikasiScreen(),
                ),
              );
            },
          ),
          ProfileMenuItem(
            icon: Iconsax.support,
            title: "Pusat Bantuan",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PusatBantuanScreen(),
                ),
              );
            },
          ),
          Divider(
            indent: 20,
            endIndent: 20,
            color: theme.dividerColor,
          ),
          ProfileMenuItem(
            icon: Iconsax.logout,
            title: "Logout",
            textColor: theme.colorScheme.error,
            onTap: () {
              _showLogoutConfirmationDialog(context, theme);
            },
          ),
        ],
      ),
    );
  }

  // Fungsi untuk menampilkan modal konfirmasi logout
  void _showLogoutConfirmationDialog(BuildContext context, ThemeData theme) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            "Keluar dari Akun Anda",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
          content: Text(
            "Lanjutkan untuk keluar?",
            style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Batal",
                style: TextStyle(color: theme.colorScheme.outline),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                "Lanjutkan",
                style: TextStyle(color: theme.colorScheme.error),
              ),
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
