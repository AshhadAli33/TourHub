import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../services/auth_service.dart';
import '../../utils/app_snackbar.dart';

class LoginController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;
  final isPasswordVisible = false.obs;

  void togglePassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      AppSnackbar.error('Error', 'Email & Password cannot be empty');
      return;
    }

    try {
      isLoading.value = true;

      final user = await _authService.login(email: email, password: password);

      if (user != null) {
        Get.offAllNamed(AppRoutes.home);
      }
    } catch (e) {
      AppSnackbar.error(
        'Login Failed',
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
    passwordController.dispose();
    super.onClose();
  }
}
