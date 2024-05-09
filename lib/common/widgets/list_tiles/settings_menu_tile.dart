import 'package:dona/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppSettigsMenuTile extends StatelessWidget {
  const AppSettigsMenuTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon,
      this.trailing,
      this.onTap});

  final String title, subtitle;
  final IconData icon;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: AppColors.primary,
      ),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
