import 'package:flutter/material.dart';
import '../../../../app/core/constants/color_constants.dart';
import '../../../main_app/presentation/pages/main_screen.dart';

class EstimationResultScreen extends StatelessWidget {
  const EstimationResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
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
            Text(
              "Hasil Estimasi",
              style: textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Berikut adalah hasil estimasi biaya layanan kesehatan anda",
              style: textTheme.bodyMedium?.copyWith(color: AppColors.grey),
            ),
            const SizedBox(height: 24),
            Text(
              "Total Estimasi",
              style:
                  textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildCostCard(context),
            const Spacer(),
            _buildBottomButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCostCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(25),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          _buildCostRow(context, "Layanan Kesehatan", "Rp100.000"),
          _buildCostRow(context, "Konsultasi Dokter", "Rp750.000",
              subtext: "-Rp500.000 (BPJS)"),
          _buildCostRow(context, "Obat-obatan", "Rp200.000",
              subtext: "-Rp180.000 (BPJS)"),
          const Divider(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.accentBlue.withAlpha(25),
              borderRadius: BorderRadius.circular(8),
            ),
            child: _buildCostRow(context, "Total", "Rp370.000", isTotal: true),
          ),
        ],
      ),
    );
  }

  Widget _buildCostRow(BuildContext context, String item, String price,
      {String? subtext, bool isTotal = false}) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final itemStyle = isTotal
        ? textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold, color: AppColors.primaryDarkGreen)
        : textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface);

    final priceStyle = isTotal
        ? textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold, color: AppColors.primaryDarkGreen)
        : textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold, color: colorScheme.onSurface);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(item, style: itemStyle),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price, style: priceStyle),
              if (subtext != null)
                Text(
                  subtext,
                  style: textTheme.bodySmall?.copyWith(color: AppColors.grey),
                ),
            ],
          )
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
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const MainScreen(initialIndex: 2)),
              (Route<dynamic> route) => false,
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accentBlue,
            foregroundColor: AppColors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text("Gunakan Rekomendasi"),
        ),
      ),
    );
  }
}
