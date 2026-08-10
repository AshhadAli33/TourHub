import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/auth_service.dart';
import '../../utils/app_snackbar.dart';

class ForgotPasswordController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  final emailController = TextEditingController();

  final isLoading = false.obs;

  Future<void> resetPassword() async {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      AppSnackbar.error('Error', 'Email is required');
      return;
    }

    if (!GetUtils.isEmail(email)) {
      AppSnackbar.error('Error', 'Please enter a valid email address');
      return;
    }

    try {
      isLoading.value = true;

      await _authService.sendPasswordResetEmail(email);

      AppSnackbar.success(
        'Success',
        'Password reset email sent. Check your inbox.',
      );
    } catch (e) {
      AppSnackbar.error(
        'Error',
        e.toString(),
        duration: const Duration(seconds: 4),
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
