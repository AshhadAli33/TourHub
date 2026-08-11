import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/chat_time_format.dart';

class DateSeparator extends StatelessWidget {
  final DateTime date;

  const DateSeparator({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.white12,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.white.withValues(alpha: 0.1)),
          ),
          child: Text(
            formatDateSeparator(date),
            style: TextStyle(
              color: AppColors.white70,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}
