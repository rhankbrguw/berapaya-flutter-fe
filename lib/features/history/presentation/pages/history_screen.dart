import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../widgets/history_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ganti ini dengan data asli nanti
    final bool hasHistory = true;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Riwayat Estimasi",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: hasHistory ? _buildHistoryList() : _buildEmptyState(),
    );
  }

  Widget _buildHistoryList() {
    return ListView.builder(
      padding: const EdgeInsets.all(20.0),
      itemCount: 5, // Jumlah dummy data
      itemBuilder: (context, index) {
        return const HistoryCard();
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Iconsax.document_text_1,
            size: 80,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 16),
          const Text(
            "Belum Ada Riwayat",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          const Text(
            "Hasil estimasi Anda akan muncul di sini.",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
