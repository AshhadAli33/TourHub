import 'dart:ui';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class ProfileSectionCard extends StatelessWidget {
  final String? title;
  final List<Widget> children;

  const ProfileSectionCard({super.key, this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 10),
            child: Text(
              title!,
              style: TextStyle(
                color: AppColors.white70,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ],
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: AppColors.white.withValues(alpha: 0.15),
                ),
              ),
              child: Column(
                children: [
                  for (var i = 0; i < children.length; i++) ...[
                    children[i],
                    if (i != children.length - 1)
                      Divider(
                        height: 1,
                        indent: 66,
                        endIndent: 14,
                        color: AppColors.white.withValues(alpha: 0.08),
                      ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
