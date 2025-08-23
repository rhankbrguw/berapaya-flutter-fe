import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'edit_profile_screen.dart';
import 'edit_pengaturan_notifikasi_screen.dart';
import 'pusat_bantuan_screen.dart';
import '../widgets/profile_menu_item.dart';
import '../../../authentication/presentation/pages/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profil",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  "https://placehold.co/100x100/74B3CE/FFFFFF?text=L"),
            ),
            const SizedBox(height: 16),
            const Text(
              "Lucyana",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "lucyana@email.com",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 32),
            _buildMenuGroup(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuGroup(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
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
                    builder: (context) => const EditProfileScreen()),
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
                    builder: (context) => const EditPengaturanNotifikasi()),
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
                    builder: (context) => const PusatBantuanScreen()),
              );
            },
          ),
          const Divider(indent: 20, endIndent: 20),
          ProfileMenuItem(
            icon: Iconsax.logout,
            title: "Logout",
            textColor: Colors.red,
            onTap: () {
              _showLogoutConfirmationDialog(context);
            },
          ),
        ],
      ),
    );
  }

  // Fungsi untuk menampilkan modal konfirmasi logout
  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text("Keluar dari Akun Anda",
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: const Text("Lanjutkan untuk keluar?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Batal",
                  style: TextStyle(color: Colors.grey)),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup modal
              },
            ),
            TextButton(
              child: const Text("Lanjutkan",
                  style: TextStyle(color: Colors.red)),
              onPressed: () {
                // Tutup modal lalu navigasi ke halaman login dan hapus riwayat navigasi
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
