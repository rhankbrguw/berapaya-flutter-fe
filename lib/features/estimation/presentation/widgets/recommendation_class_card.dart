import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../app/core/constants/color_constants.dart';

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
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border:
            isBest ? Border.all(color: AppColors.accentBlue, width: 1.5) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(20),
            spreadRadius: 1,
            blurRadius: 10,
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
                      color: AppColors.grey),
                ),
              if (discount != null)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    discount!,
                    style: TextStyle(
                        color: Colors.orange.shade800,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
            ],
          ),
          if (isBest)
            const CircleAvatar(
              backgroundColor: AppColors.accentBlue,
              radius: 14,
              child: Icon(Iconsax.star_1, color: AppColors.white, size: 16),
            ),
          Text(price, style: textTheme.titleLarge),
        ],
      ),
    );
  }
}
