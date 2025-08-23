import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../app/core/constants/color_constants.dart';
import '../widgets/history_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final bool hasHistory = true;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Riwayat Estimasi",
          style: textTheme.titleLarge?.copyWith(
              color: colorScheme.onSurface, fontWeight: FontWeight.bold),
        ),
      ),
      body: hasHistory ? _buildHistoryList() : _buildEmptyState(context),
    );
  }

  Widget _buildHistoryList() {
    return ListView.builder(
      padding: const EdgeInsets.all(20.0),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const HistoryCard();
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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
          Text(
            "Belum Ada Riwayat",
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Hasil estimasi Anda akan muncul di sini.",
            style: textTheme.bodyMedium?.copyWith(color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}
