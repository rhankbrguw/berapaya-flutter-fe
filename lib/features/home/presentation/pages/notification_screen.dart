import 'package:berapaya_fe_flutter/app/config/theme/semantic_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final semanticColors = theme.extension<AppSemanticColors>()!;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        leading: IconButton(
          icon: Icon(Iconsax.arrow_left_2, color: theme.colorScheme.onSurface),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Notifikasi",
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNotificationSection(
              context,
              title: "Hari Ini",
              notifications: [
                _buildNotificationItem(
                  context,
                  icon: Iconsax.calendar_tick,
                  iconColor: semanticColors.info!,
                  title: "Pengingat Jadwal Vaksin",
                  subtitle:
                      "Vaksin Covid-19 Anda dijadwalkan besok pukul 10:00 di RS Budi Lestari.",
                  time: "1 jam yang lalu",
                ),
                const Divider(indent: 56),
                _buildNotificationItem(
                  context,
                  icon: Iconsax.money_send,
                  iconColor: semanticColors.success!,
                  title: "Pembaruan Biaya Perkiraan",
                  subtitle:
                      "Estimasi biaya konsultasi dokter spesialis anak di RS Ceria telah diperbarui.",
                  time: "2 jam yang lalu",
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildNotificationSection(
              context,
              title: "Minggu Lalu",
              notifications: [
                _buildNotificationItem(
                  context,
                  icon: Iconsax.discount_shape,
                  iconColor: semanticColors.warning!,
                  title: "Promo Layanan Kesehatan",
                  subtitle:
                      "Dapatkan diskon 15% untuk cek darah di klinik Sehat Bersama.",
                  time: "3 hari yang lalu",
                ),
                const Divider(indent: 56),
                _buildNotificationItem(
                  context,
                  icon: Iconsax.health,
                  iconColor: semanticColors.tips!,
                  title: "Tips Kesehatan Terbaru",
                  subtitle:
                      "Artikel terbaru: 5 Cara Efektif Menjaga Imun Tubuh.",
                  time: "5 hari yang lalu",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationSection(
    BuildContext context, {
    required String title,
    required List<Widget> notifications,
  }) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleSmall
              ?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6)),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(children: notifications),
        ),
      ],
    );
  }

  Widget _buildNotificationItem(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String time,
  }) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
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
            style: textTheme.bodySmall
                ?.copyWith(color: colorScheme.onSurface.withValues(alpha: 0.6)),
          ),
        ],
      ),
      onTap: () {},
    );
  }
}
