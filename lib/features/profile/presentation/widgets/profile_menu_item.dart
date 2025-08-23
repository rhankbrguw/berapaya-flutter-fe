import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../app/core/constants/color_constants.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? textColor;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: AppColors.accentBlue),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
      ),
      trailing: const Icon(
        Iconsax.arrow_right_3,
        size: 18,
        color: AppColors.grey,
      ),
    );
  }
}
