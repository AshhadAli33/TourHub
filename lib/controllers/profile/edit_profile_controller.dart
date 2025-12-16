import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditProfileController extends GetxController {
  var nameController = TextEditingController();
  var isLoading = false.obs;

  void updateProfile() async {
    if (nameController.text.isEmpty) return;

    try {
      isLoading.value = true;
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updateDisplayName(nameController.text.trim());
        await user.reload();
      }
      Get.back();
    } finally {
      isLoading.value = false;
    }
  }
}
