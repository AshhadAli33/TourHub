import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class ProfileMenuTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool isDanger;

  const ProfileMenuTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          color: isDanger ? AppColors.danger : AppColors.white,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isDanger ? AppColors.danger : AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: AppColors.white70,
        ),
      ),
    );
  }
}
