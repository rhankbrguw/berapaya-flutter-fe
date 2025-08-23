import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PusatBantuanScreen extends StatelessWidget {
  const PusatBantuanScreen({super.key});

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
          "Pusat Bantuan",
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
          children: [
            _buildFAQSection(),
            const SizedBox(height: 24),
            _buildContactSection(),
          ],
        ),
      ),
    );
  }

  // Widget untuk bagian FAQ
  Widget _buildFAQSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Iconsax.message_question),
            title: Text(
              "FAQ (Pertanyaan Umum)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(indent: 20, endIndent: 20),
          _buildFAQItem(
            question: "Bagaimana cara mendapatkan perkiraan biaya?",
            answer: "Anda bisa menggunakan fitur 'Perkiraan Biaya' di menu utama. Masukkan detail kondisi dan rumah sakit, lalu sistem akan memberikan estimasi biayanya.",
          ),
          _buildFAQItem(
            question: "Apakah data saya aman?",
            answer: "Kami menjamin keamanan data pribadi Anda. Semua informasi disimpan dengan enkripsi dan hanya digunakan untuk memberikan layanan terbaik.",
          ),
          _buildFAQItem(
            question: "Bagaimana cara mencari rumah sakit terdekat?",
            answer: "Pastikan Anda telah mengaktifkan layanan lokasi di perangkat Anda. Lalu, pilih menu 'Cari RS Terdekat' untuk melihat daftar rumah sakit di sekitar Anda.",
          ),
        ],
      ),
    );
  }

  // Widget untuk item FAQ yang dapat dibuka-tutup
  Widget _buildFAQItem({required String question, required String answer}) {
    return ExpansionTile(
      title: Text(
        question,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(answer),
        ),
      ],
    );
  }

  // Widget untuk bagian kontak
  Widget _buildContactSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Iconsax.call),
            title: Text(
              "Hubungi Kami",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(indent: 20, endIndent: 20),
          ListTile(
            leading: const Icon(Iconsax.message),
            title: const Text("Kirim Pesan"),
            subtitle: const Text("Silakan kirim pertanyaan Anda melalui email."),
            onTap: () {
              // Tambahkan logika untuk membuka email client
              // Misalnya, dengan package `url_launcher`
            },
          ),
          // ListTile(
          //   leading: const Icon(Iconsax.whatsapp),
          //   title: const Text("Hubungi via WhatsApp"),
          //   subtitle: const Text("+62 812 3456 7890"),
          //   onTap: () {
          //     // Tambahkan logika untuk membuka WhatsApp
          //   },
          // ),
        ],
      ),
    );
  }
}
