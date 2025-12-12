import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tourhub/routes/app_routes.dart';

class SignupController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isLoading = false.obs;
  var isPasswordVisible = false.obs;

  void togglePassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void signup() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'All fields are required',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
      return;
    }

    // Validate email format
    if (!GetUtils.isEmail(emailController.text.trim())) {
      Get.snackbar(
        'Invalid Email',
        'Please enter a valid email address',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
      return;
    }

    // Validate password strength
    if (passwordController.text.length < 6) {
      Get.snackbar(
        'Weak Password',
        'Password must be at least 6 characters long',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
      return;
    }

    try {
      isLoading.value = true;
      print('Attempting to sign up with email: ${emailController.text.trim()}');
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
      if (userCredential.user != null) {
        print('Signup successful for user: ${userCredential.user!.email}');
        // Optional: set display name
        await userCredential.user!.updateDisplayName(
          nameController.text.trim(),
        );
        Get.offAllNamed(AppRoutes.home);
      }
    } on FirebaseAuthException catch (e) {
      print('Signup failed with error: ${e.code} - ${e.message}');
      Get.snackbar(
        'Signup Failed',
        e.message ?? 'Unknown error occurred. Please try again.',
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
