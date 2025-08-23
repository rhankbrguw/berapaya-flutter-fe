import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
    final ThemeData theme = Theme.of(context);

    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: theme.colorScheme.tertiary),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
      trailing: Icon(
        Iconsax.arrow_right_3,
        size: 18,
        color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
      ),
    );
  }
}
