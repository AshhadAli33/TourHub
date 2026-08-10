import 'package:get/get.dart';
import 'app_colors.dart';

class AppSnackbar {
  static void error(
    String title,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.error.withValues(alpha: 0.8),
      colorText: AppColors.white,
      duration: duration,
    );
  }

  static void success(
    String title,
    String message, {
    Duration duration = const Duration(seconds: 4),
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.success.withValues(alpha: 0.8),
      colorText: AppColors.white,
      duration: duration,
    );
  }
}
