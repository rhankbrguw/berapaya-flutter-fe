import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../main_app/presentation/pages/main_screen.dart';

class EstimationResultScreen extends StatelessWidget {
  const EstimationResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
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
              "Hasil Estimasi",
              style: textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Berikut adalah hasil estimasi biaya layanan kesehatan anda",
              style: textTheme.bodyMedium
                  ?.copyWith(color: colorScheme.onSurface.withOpacity(0.6)),
            ),
            const SizedBox(height: 24),
            Text(
              "Total Estimasi",
              style:
                  textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildCostCard(context, theme),
            const Spacer(),
            _buildBottomButton(context, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildCostCard(BuildContext context, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: theme.primaryColor.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildCostRow(context, theme, "Layanan Kesehatan", "Rp100.000"),
          _buildCostRow(context, theme, "Konsultasi Dokter", "Rp750.000",
              subtext: "-Rp500.000 (BPJS)"),
          _buildCostRow(context, theme, "Obat-obatan", "Rp200.000",
              subtext: "-Rp180.000 (BPJS)"),
          const Divider(height: 32),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: theme.colorScheme.tertiary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: _buildCostRow(context, theme, "Total", "Rp370.000",
                isTotal: true),
          ),
        ],
      ),
    );
  }

  Widget _buildCostRow(
      BuildContext context, ThemeData theme, String item, String price,
      {String? subtext, bool isTotal = false}) {
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    final itemStyle = isTotal
        ? textTheme.titleMedium
            ?.copyWith(fontWeight: FontWeight.bold, color: colorScheme.primary)
        : textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface);

    final priceStyle = isTotal
        ? textTheme.titleLarge
            ?.copyWith(fontWeight: FontWeight.bold, color: colorScheme.primary)
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
                  style: textTheme.bodySmall
                      ?.copyWith(color: colorScheme.onSurface.withOpacity(0.6)),
                ),
            ],
          )
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
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const MainScreen(initialIndex: 2)),
              (Route<dynamic> route) => false,
            );
          },
          style: customButtonStyle,
          child: const Text("Gunakan Rekomendasi"),
        ),
      ),
    );
  }
}
