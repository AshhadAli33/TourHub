import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/profile/edit_profile_controller.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/common/app_text_field.dart';
import '../../widgets/common/gradient_scaffold.dart';
import '../../widgets/common/loading_button.dart';
import '../../widgets/common/responsive_center.dart';

class EditProfileView extends StatelessWidget {
  EditProfileView({super.key});
  final controller = Get.find<EditProfileController>();

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.onPrimary,
        title: const Text("Edit Profile"),
      ),
      padding: const EdgeInsets.all(20),
      body: ResponsiveCenter(
        child: Column(
          children: [
            AppTextField(
              controller: controller.nameController,
              hintText: "Full Name",
              borderSide: const BorderSide(),
            ),
            SizedBox(height: 20),
            LoadingButton(
              isLoading: controller.isLoading,
              onPressed: controller.updateProfile,
              label: "Save",
              textStyle: TextStyle(color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
