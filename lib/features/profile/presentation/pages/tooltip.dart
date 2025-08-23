import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PusatBantuanScreen extends StatelessWidget {
  const PusatBantuanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        leading: IconButton(
          icon: Icon(Iconsax.arrow_left_2, color: theme.colorScheme.onSurface),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Pusat Bantuan",
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildFAQSection(context, theme),
            const SizedBox(height: 24),
            _buildContactSection(context, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQSection(BuildContext context, ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Iconsax.message_question,
                color: theme.colorScheme.tertiary),
            title: Text(
              "FAQ (Pertanyaan Umum)",
              style: theme.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(indent: 20, endIndent: 20),
          _buildFAQItem(
            theme,
            question: "Bagaimana cara mendapatkan perkiraan biaya?",
            answer:
                "Anda bisa menggunakan fitur 'Perkiraan Biaya' di menu utama. Masukkan detail kondisi dan rumah sakit, lalu sistem akan memberikan estimasi biayanya.",
          ),
          _buildFAQItem(
            theme,
            question: "Apakah data saya aman?",
            answer:
                "Kami menjamin keamanan data pribadi Anda. Semua informasi disimpan dengan enkripsi dan hanya digunakan untuk memberikan layanan terbaik.",
          ),
          _buildFAQItem(
            theme,
            question: "Bagaimana cara mencari rumah sakit terdekat?",
            answer:
                "Pastikan Anda telah mengaktifkan layanan lokasi di perangkat Anda. Lalu, pilih menu 'Cari RS Terdekat' untuk melihat daftar rumah sakit di sekitar Anda.",
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(ThemeData theme,
      {required String question, required String answer}) {
    return ExpansionTile(
      title: Text(
        question,
        style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Text(answer, style: theme.textTheme.bodyMedium),
        ),
      ],
    );
  }

  Widget _buildContactSection(BuildContext context, ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Iconsax.call, color: theme.colorScheme.tertiary),
            title: Text(
              "Hubungi Kami",
              style: theme.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(indent: 20, endIndent: 20),
          ListTile(
            leading: const Icon(Iconsax.message),
            title: const Text("Kirim Pesan"),
            subtitle:
                const Text("Silakan kirim pertanyaan Anda melalui email."),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
