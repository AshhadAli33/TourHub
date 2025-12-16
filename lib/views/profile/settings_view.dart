import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/profile/settings_controller.dart';
import '../../../utils/app_colors.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});
  final controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.onboardingGradient),
        child: ListView(
          children: [
            Obx(
              () => SwitchListTile(
                value: controller.isNotificationOn.value,
                onChanged: (_) => controller.toggleNotification(),
                title: Text(
                  "Notifications",
                  style: TextStyle(color: Colors.white),
                ),
                activeColor: AppColors.secondaryColor,
              ),
            ),
            Obx(
              () => SwitchListTile(
                value: controller.isDarkMode.value,
                onChanged: (_) => controller.toggleTheme(),
                title: Text("Dark Mode", style: TextStyle(color: Colors.white)),
                activeColor: AppColors.secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
