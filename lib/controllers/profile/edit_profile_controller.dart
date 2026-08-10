import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../services/auth_service.dart';

class EditProfileController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  var nameController = TextEditingController();
  var isLoading = false.obs;

  void updateProfile() async {
    if (nameController.text.isEmpty) return;

    try {
      isLoading.value = true;
      await _authService.updateDisplayName(nameController.text.trim());
      Get.back();
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
