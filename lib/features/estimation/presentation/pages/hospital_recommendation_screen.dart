import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../app/core/constants/color_constants.dart';
import 'estimation_result_screen.dart';
import 'hospital_detail_screen.dart';

class HospitalRecommendationScreen extends StatelessWidget {
  const HospitalRecommendationScreen({super.key});

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
        title: Text("Kelas A",
            style:
                textTheme.titleLarge?.copyWith(color: colorScheme.onSurface)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    _buildHospitalCard(context),
                  ],
                ),
              ),
            ),
            _buildBottomButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHospitalCard(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              "https://placehold.co/600x400/d6f3f4/172a3a?text=RS+Ukrida",
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Rumah Sakit Ukrida",
                    style: textTheme.titleLarge
                        ?.copyWith(color: colorScheme.onSurface)),
                const SizedBox(height: 8),
                Text(
                  "Jl. Arjuna Utara No.6, RT.6/RW.2, Duri Kepa, Kec. Kb. Jeruk, Kota Jakarta Barat...",
                  style: textTheme.bodyMedium?.copyWith(color: AppColors.grey),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HospitalDetailScreen()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text("Lihat Detail",
                        style: TextStyle(color: colorScheme.onSurface)),
                  ),
                ),
                const SizedBox(height: 24),
                Text("Alasan Rekomendasi:",
                    style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface)),
                const SizedBox(height: 8),
                _buildReasonItem(context, "Terdekat dengan Anda"),
                _buildReasonItem(context, "Biaya cocok dengan profile anda"),
                _buildReasonItem(context,
                    "Konsultasikan dengan pihak rumah sakit untuk informasi biaya yang lebih akurat."),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReasonItem(BuildContext context, String text) {
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
                  builder: (context) => const EstimationResultScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accentBlue,
            foregroundColor: AppColors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text("Detail Estimasi"),
        ),
      ),
    );
  }
}
