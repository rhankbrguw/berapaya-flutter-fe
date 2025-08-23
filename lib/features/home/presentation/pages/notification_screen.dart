import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:berapaya_fe_flutter/app/core/constants/color_constants.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundLight,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.darkestText),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Notifikasi",
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.darkestText,
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
                  icon: Iconsax.calendar_tick,
                  iconColor: AppColors.blueInfo,
                  title: "Pengingat Jadwal Vaksin",
                  subtitle:
                      "Vaksin Covid-19 Anda dijadwalkan besok pukul 10:00 di RS Budi Lestari.",
                  time: "1 jam yang lalu",
                  textTheme: textTheme,
                ),
                _buildNotificationItem(
                  icon: Iconsax.money_send,
                  iconColor: AppColors.greenSuccess,
                  title: "Pembaruan Biaya Perkiraan",
                  subtitle:
                      "Estimasi biaya konsultasi dokter spesialis anak di RS Ceria telah diperbarui.",
                  time: "2 jam yang lalu",
                  textTheme: textTheme,
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildNotificationSection(
              title: "Minggu Lalu",
              notifications: [
                _buildNotificationItem(
                  icon: Iconsax.discount_shape,
                  iconColor: AppColors.orangeWarning,
                  title: "Promo Layanan Kesehatan",
                  subtitle:
                      "Dapatkan diskon 15% untuk cek darah di klinik Sehat Bersama.",
                  time: "3 hari yang lalu",
                  textTheme: textTheme,
                ),
                _buildNotificationItem(
                  icon: Iconsax.health,
                  iconColor: AppColors.purpleTips,
                  title: "Tips Kesehatan Terbaru",
                  subtitle:
                      "Artikel terbaru: 5 Cara Efektif Menjaga Imun Tubuh.",
                  time: "5 hari yang lalu",
                  textTheme: textTheme,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

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
            fontWeight: FontWeight.bold,
            color: AppColors.neutralGrey,
          ),
        ),
        const SizedBox(height: 10),
        Column(children: notifications),
      ],
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String time,
    required TextTheme textTheme,
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
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(subtitle, maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 4),
            Text(
              time,
              style: textTheme.bodySmall?.copyWith(color: AppColors.grey),
            ),
          ],
        ),
        onTap: () {
          // TODO: Navigasi ke detail notifikasi
        },
      ),
    );
  }
}
