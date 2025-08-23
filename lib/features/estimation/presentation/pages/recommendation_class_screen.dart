import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/recommendation_class_card.dart';
import 'hospital_recommendation_screen.dart';

class RecommendationClassScreen extends StatefulWidget {
  const RecommendationClassScreen({super.key});

  @override
  State<RecommendationClassScreen> createState() =>
      _RecommendationClassScreenState();
}

class _RecommendationClassScreenState extends State<RecommendationClassScreen> {
  String _selectedClass = "Golongan A";

  void _handleClassSelection(String className) {
    setState(() {
      _selectedClass = className;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        leading: IconButton(
          icon: Icon(Iconsax.arrow_left_2, color: colorScheme.onSurface),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Rekomendasi",
              style: textTheme.headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Berikut hasil berdasarkan golongan dan rekomendasi terbaik untuk anda",
              style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.6)),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () => _handleClassSelection("Golongan A"),
              child: RecommendationClassCard(
                className: "Golongan A",
                price: "Rp370.000",
                originalPrice: "Rp680.000",
                isBest: _selectedClass == "Golongan A",
              ),
            ),
            GestureDetector(
              onTap: () => _handleClassSelection("Golongan B"),
              child: RecommendationClassCard(
                className: "Golongan B",
                price: "Rp250.000",
                discount: "-53% discount",
                isBest: _selectedClass == "Golongan B",
              ),
            ),
            GestureDetector(
              onTap: () => _handleClassSelection("Golongan C"),
              child: RecommendationClassCard(
                className: "Golongan C",
                price: "Rp100.000",
                isBest: _selectedClass == "Golongan C",
              ),
            ),
            const SizedBox(height: 24),
            _buildInfoBox(context, theme),
            const Spacer(),
            _buildBottomButton(context, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox(BuildContext context, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Informasi Penting:",
            style: theme.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildInfoItem(context, theme,
              "Estimasi biaya ini hanya perkiraan dan dapat berbeda dengan biaya aktual."),
          _buildInfoItem(context, theme,
              "Biaya dapat berubah tergantung pada kondisi medis pasien."),
          _buildInfoItem(context, theme,
              "Konsultasikan dengan pihak rumah sakit untuk informasi biaya yang lebih akurat."),
        ],
      ),
    );
  }

  Widget _buildInfoItem(BuildContext context, ThemeData theme, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Iconsax.star_1, color: theme.colorScheme.tertiary, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text, style: theme.textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context, ThemeData theme) {
    final ButtonStyle customButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: theme.colorScheme.tertiary,
      foregroundColor: theme.colorScheme.onPrimary,
      padding: const EdgeInsets.symmetric(vertical: 16),
    ).merge(theme.elevatedButtonTheme.style);

    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
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
          style: customButtonStyle,
          child: const Text("Pilih Rekomendasi"),
        ),
      ),
    );
  }
}
