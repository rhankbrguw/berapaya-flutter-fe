import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Notifikasi",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNotificationSection(
              title: "Hari Ini",
              notifications: [
                _buildNotificationItem(
                  context,
                  icon: Iconsax.calendar_tick,
                  iconColor: Colors.blue.shade800,
                  title: "Pengingat Jadwal Vaksin",
                  subtitle: "Vaksin Covid-19 Anda dijadwalkan besok pukul 10:00 di RS Budi Lestari.",
                  time: "1 jam yang lalu",
                ),
                _buildNotificationItem(
                  context,
                  icon: Iconsax.money_send,
                  iconColor: Colors.green.shade800,
                  title: "Pembaruan Biaya Perkiraan",
                  subtitle: "Estimasi biaya konsultasi dokter spesialis anak di RS Ceria telah diperbarui.",
                  time: "2 jam yang lalu",
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildNotificationSection(
              title: "Minggu Lalu",
              notifications: [
                _buildNotificationItem(
                  context,
                  icon: Iconsax.discount_shape,
                  iconColor: Colors.orange.shade800,
                  title: "Promo Layanan Kesehatan",
                  subtitle: "Dapatkan diskon 15% untuk cek darah di klinik Sehat Bersama.",
                  time: "3 hari yang lalu",
                ),
                _buildNotificationItem(
                  context,
                  icon: Iconsax.health,
                  iconColor: Colors.purple.shade800,
                  title: "Tips Kesehatan Terbaru",
                  subtitle: "Artikel terbaru: 5 Cara Efektif Menjaga Imun Tubuh.",
                  time: "5 hari yang lalu",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk membuat bagian notifikasi (misalnya, "Hari Ini", "Minggu Lalu")
  Widget _buildNotificationSection({
    required String title,
    required List<Widget> notifications,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 10),
        Column(children: notifications),
      ],
    );
  }

  // Widget untuk membuat item notifikasi
  Widget _buildNotificationItem(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: iconColor, size: 30),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(subtitle, maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 4),
            Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        onTap: () {
          // Logika ketika notifikasi diklik, misal navigasi ke detail notifikasi
        },
      ),
    );
  }
}
