import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'hospital_recommendation_screen.dart';
import '../widgets/recommendation_class_card.dart';

class RecommendationClassScreen extends StatelessWidget {
  const RecommendationClassScreen({super.key});

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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Rekomendasi",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Berikut hasil berdasarkan golongan dan rekomendasi terbaik untuk anda",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 24),
            const RecommendationClassCard(
              className: "Kelas A",
              price: "Rp370.000",
              originalPrice: "Rp680.000",
              isBest: true,
            ),
            const RecommendationClassCard(
              className: "Kelas B",
              price: "Rp250.000",
              discount: "-53% discount",
            ),
            const RecommendationClassCard(
              className: "Kelas C",
              price: "Rp100.000",
            ),
            const SizedBox(height: 24),
            _buildInfoBox(),
            const Spacer(),
            _buildBottomButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFD6F3F4).withAlpha(128),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Informasi Penting:",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _buildInfoItem(
              "Estimasi biaya ini hanya perkiraan dan dapat berbeda dengan biaya aktual."),
          _buildInfoItem(
              "Biaya dapat berubah tergantung pada kondisi medis pasien."),
          _buildInfoItem(
              "Konsultasikan dengan pihak rumah sakit untuk informasi biaya yang lebih akurat."),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Iconsax.star_1, color: Color(0xFF74B3CE), size: 18),
          const SizedBox(width: 8),
          Expanded(
              child: Text(text, style: const TextStyle(color: Colors.black54))),
        ],
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 30), // Perubahan di sini
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const HospitalRecommendationScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF74B3CE),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text("Next", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
