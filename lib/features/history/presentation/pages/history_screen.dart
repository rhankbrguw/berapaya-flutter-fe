import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../widgets/history_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    final bool hasHistory = true;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        centerTitle: true,
        title: Text(
          "Riwayat Estimasi",
          style: textTheme.titleLarge?.copyWith(
              color: colorScheme.onSurface, fontWeight: FontWeight.bold),
        ),
      ),
      body: hasHistory ? _buildHistoryList() : _buildEmptyState(context, theme),
    );
  }

  Widget _buildHistoryList() {
    return ListView.builder(
      padding: const EdgeInsets.all(24.0),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const HistoryCard();
      },
    );
  }

  Widget _buildEmptyState(BuildContext context, ThemeData theme) {
    final TextTheme textTheme = theme.textTheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Iconsax.document_text_1,
            size: 80,
            color: theme.dividerColor,
          ),
          const SizedBox(height: 16),
          Text(
            "Belum Ada Riwayat",
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Hasil estimasi Anda akan muncul di sini.",
            style: textTheme.bodyMedium
                ?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.6)),
          ),
        ],
      ),
    );
  }
}
