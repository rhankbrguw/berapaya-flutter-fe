import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../app/core/constants/color_constants.dart';
import 'hospital_recommendation_screen.dart';
import '../widgets/recommendation_class_card.dart';

class RecommendationClassScreen extends StatelessWidget {
  const RecommendationClassScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorScheme.onSurface),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Rekomendasi",
                style: textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              "Berikut hasil berdasarkan golongan dan rekomendasi terbaik untuk anda",
              style: textTheme.bodyMedium?.copyWith(color: AppColors.grey),
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
            _buildInfoBox(context),
            const Spacer(),
            _buildBottomButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight.withAlpha(128),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Informasi Penting:",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _buildInfoItem(context,
              "Estimasi biaya ini hanya perkiraan dan dapat berbeda dengan biaya aktual."),
          _buildInfoItem(context,
              "Biaya dapat berubah tergantung pada kondisi medis pasien."),
          _buildInfoItem(context,
              "Konsultasikan dengan pihak rumah sakit untuk informasi biaya yang lebih akurat."),
        ],
      ),
    );
  }

  Widget _buildInfoItem(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Iconsax.star_1, color: AppColors.accentBlue, size: 18),
          const SizedBox(width: 8),
          Expanded(
              child: Text(text, style: Theme.of(context).textTheme.bodyMedium)),
        ],
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 30),
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
            backgroundColor: AppColors.accentBlue,
            foregroundColor: AppColors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text("Next"),
        ),
      ),
    );
  }
}
