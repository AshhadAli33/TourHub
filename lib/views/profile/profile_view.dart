import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/profile/profile_controller.dart';
import '../../utils/app_colors.dart';
import '../../widgets/common/gradient_scaffold.dart';
import '../../widgets/common/responsive_center.dart';
import '../../widgets/profile/profile_menu_tile.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: ResponsiveCenter(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),

              CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.white24,
                child: Icon(Icons.person, size: 50, color: AppColors.white),
              ),

              const SizedBox(height: 12),

              Obx(
                () => Text(
                  controller.user.value?.name ?? "User Name",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
              Obx(
                () => Text(
                  controller.user.value?.email ?? "user@email.com",
                  style: TextStyle(color: AppColors.white70),
                ),
              ),

              const SizedBox(height: 30),

              ProfileMenuTile(
                title: "Edit Profile",
                icon: Icons.edit,
                onTap: () => Get.toNamed('/edit-profile'),
              ),
              ProfileMenuTile(
                title: "Settings",
                icon: Icons.settings,
                onTap: () => Get.toNamed('/settings'),
              ),
              ProfileMenuTile(
                title: "My Bookings",
                icon: Icons.calendar_month,
                onTap: () {},
              ),
              ProfileMenuTile(
                title: "Documents",
                icon: Icons.folder,
                onTap: () {},
              ),
              ProfileMenuTile(
                title: "Logout",
                icon: Icons.logout,
                onTap: controller.showLogoutSheet,
                isDanger: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
