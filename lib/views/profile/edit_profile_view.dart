import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/profile/edit_profile_controller.dart';
import '../../../utils/app_colors.dart';

class EditProfileView extends StatelessWidget {
  EditProfileView({super.key});
  final controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text("Edit Profile",style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.onboardingGradient),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller.nameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Full Name",
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            SizedBox(height: 20),
            Obx(
              () => controller.isLoading.value
                  ? CircularProgressIndicator(color: AppColors.secondaryColor)
                  : ElevatedButton(
                      onPressed: controller.updateProfile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondaryColor,
                        padding: EdgeInsets.symmetric(
                          horizontal: 80,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        "Save",
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
