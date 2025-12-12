import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var emailController = TextEditingController();
  var isLoading = false.obs;

  void resetPassword() async {
    if (emailController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Email is required',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
      return;
    }

    try {
      isLoading.value = true;
      await _auth.sendPasswordResetEmail(email: emailController.text.trim());
      Get.snackbar(
        'Success',
        'Password reset email sent. Check your inbox.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.8),
        colorText: Colors.white,
        duration: Duration(seconds: 4),
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error',
        e.message ?? 'Failed to send reset email. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        duration: Duration(seconds: 4),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
