import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HospitalCard extends StatefulWidget {
  const HospitalCard({super.key});

  @override
  State<HospitalCard> createState() => _HospitalCardState();
}

class _HospitalCardState extends State<HospitalCard> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: theme.primaryColor.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              "https://images.unsplash.com/photo-1586773860418-d37222d8fce3?q=80&w=2073&auto=format&fit=crop",
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
                Text("Rumah Sakit Ukrida", style: textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  "Jl. Arjuna Utara No.6, RT.6/RW.2, Duri Kepa, Kec. Kb. Jeruk, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11510",
                  style: textTheme.bodyMedium
                      ?.copyWith(color: colorScheme.onSurface.withOpacity(0.6)),
                ),
                const SizedBox(height: 8),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: _isExpanded
                      ? _buildExpandedContent(context, theme)
                      : const SizedBox.shrink(),
                ),
                GestureDetector(
                  onTap: _toggleExpanded,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _isExpanded ? "See Less" : "See More",
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        _isExpanded ? Iconsax.arrow_up_2 : Iconsax.arrow_down_1,
                        color: colorScheme.tertiary,
                        size: 16,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text("Alasan Rekomendasi:",
                    style: textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                _buildReasonItem(context, theme, "Terdekat dengan Anda"),
                _buildReasonItem(
                    context, theme, "Biaya cocok dengan profile anda"),
                _buildReasonItem(context, theme,
                    "Konsultasikan dengan pihak rumah sakit untuk informasi biaya yang lebih akurat."),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReasonItem(BuildContext context, ThemeData theme, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Iconsax.star_1, color: theme.colorScheme.tertiary, size: 18),
          const SizedBox(width: 8),
          Expanded(
              child: Text(text, style: Theme.of(context).textTheme.bodyMedium)),
        ],
      ),
    );
  }

  Widget _buildExpandedContent(BuildContext context, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 24),
        Text("Overview",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        _buildReasonItem(context, theme, "RSU Kelas B"),
        _buildReasonItem(context, theme, "RS rujukan tingkat kabupaten."),
        _buildReasonItem(context, theme,
            "Memiliki spesialisasi dasar (Penyakit Dalam, Bedah, Anak, Obgyn)."),
        _buildReasonItem(context, theme,
            "Pelayanan terbatas, untuk kasus ringan hingga menengah."),
        const SizedBox(height: 8),
      ],
    );
  }
}
