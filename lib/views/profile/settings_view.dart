import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/profile/settings_controller.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/common/gradient_scaffold.dart';
import '../../widgets/common/responsive_center.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});
  final controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.onPrimary,
      ),
      body: ResponsiveCenter(
        child: ListView(
          shrinkWrap: true,
          children: [
            Obx(
              () => SwitchListTile(
                value: controller.isNotificationOn.value,
                onChanged: (_) => controller.toggleNotification(),
                title: Text(
                  "Notifications",
                  style: TextStyle(color: AppColors.white),
                ),
                activeThumbColor: AppColors.secondaryColor,
              ),
            ),
            Obx(
              () => SwitchListTile(
                value: controller.isDarkMode.value,
                onChanged: (_) => controller.toggleTheme(),
                title: Text(
                  "Dark Mode",
                  style: TextStyle(color: AppColors.white),
                ),
                activeThumbColor: AppColors.secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
