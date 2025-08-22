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
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: isBest
            ? Border.all(color: const Color(0xFF74B3CE), width: 1.5)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(20), // Fix: withOpacity -> withAlpha
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
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              if (originalPrice != null)
                Text(
                  originalPrice!,
                  style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey),
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
              backgroundColor: Color(0xFF74B3CE),
              radius: 14,
              child: Icon(Iconsax.star_1, color: Colors.white, size: 16),
            ),
          Text(price,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
