import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_colors.dart';

class AppSnackbar {
  static void error(
    String title,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    _show(
      title,
      message,
      color: AppColors.error,
      icon: Icons.error_outline_rounded,
      duration: duration,
    );
  }

  static void success(
    String title,
    String message, {
    Duration duration = const Duration(seconds: 4),
  }) {
    _show(
      title,
      message,
      color: AppColors.success,
      icon: Icons.check_circle_outline_rounded,
      duration: duration,
    );
  }

  static void _show(
    String title,
    String message, {
    required Color color,
    required IconData icon,
    required Duration duration,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.white,
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      borderRadius: 14,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.18),
          blurRadius: 16,
          offset: const Offset(0, 6),
        ),
      ],
      icon: Icon(icon, color: color, size: 26),
      leftBarIndicatorColor: color,
      titleText: Text(
        title,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          color: AppColors.white.withValues(alpha: 0.85),
          fontSize: 13.5,
          height: 1.3,
        ),
      ),
      duration: duration,
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutCubic,
      reverseAnimationCurve: Curves.easeInCubic,
      animationDuration: const Duration(milliseconds: 300),
    );
  }
}
