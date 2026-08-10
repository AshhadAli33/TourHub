import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../services/auth_service.dart';
import '../../utils/app_snackbar.dart';

class SignupController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;
  final isPasswordVisible = false.obs;

  void togglePassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> signup() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      AppSnackbar.error('Error', 'All fields are required');
      return;
    }

    if (!GetUtils.isEmail(email)) {
      AppSnackbar.error('Invalid Email', 'Please enter a valid email address');
      return;
    }

    if (password.length < 6) {
      AppSnackbar.error(
        'Weak Password',
        'Password must be at least 6 characters long',
      );
      return;
    }

    try {
      isLoading.value = true;

      final user = await _authService.signup(email: email, password: password);

      if (user != null) {
        await user.updateDisplayName(name);
        await user.reload();

        Get.offAllNamed(AppRoutes.home);
      }
    } catch (e) {
      AppSnackbar.error(
        'Signup Failed',
        e.toString(),
        duration: const Duration(seconds: 4),
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
