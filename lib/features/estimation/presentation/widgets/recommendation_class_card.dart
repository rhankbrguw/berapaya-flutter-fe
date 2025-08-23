import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RecommendationClassCard extends StatelessWidget {
  final String className;
  final String price;
  final String? originalPrice;
  final String? discount;
  final bool isBest;

  const RecommendationClassCard({
    super.key,
    required this.className,
    required this.price,
    this.originalPrice,
    this.discount,
    this.isBest = false,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border:
            isBest ? Border.all(color: colorScheme.tertiary, width: 1.5) : null,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(className,
                  style: textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              if (originalPrice != null)
                Text(
                  originalPrice!,
                  style: textTheme.bodySmall?.copyWith(
                      decoration: TextDecoration.lineThrough,
                      color: colorScheme.onSurface.withValues(alpha: 0.6)),
                ),
              if (discount != null)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: colorScheme.errorContainer.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    discount!,
                    style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onErrorContainer,
                        fontWeight: FontWeight.w500),
                  ),
                ),
            ],
          ),
          Row(
            children: [
              Text(price, style: textTheme.titleLarge),
              if (isBest) ...[
                const SizedBox(width: 16),
                CircleAvatar(
                  backgroundColor: colorScheme.tertiary,
                  radius: 14,
                  child: Icon(Iconsax.star_1,
                      color: colorScheme.onPrimary, size: 16),
                ),
              ]
            ],
          ),
        ],
      ),
    );
  }
}
