import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/profile/profile_controller.dart';
import '../../../utils/app_colors.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.onboardingGradient),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),

              
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white24,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),

              const SizedBox(height: 12),

              Obx(
                () => Text(
                  controller.user.value?.displayName ?? "User Name",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Obx(
                () => Text(
                  controller.user.value?.email ?? "user@email.com",
                  style: TextStyle(color: Colors.white70),
                ),
              ),

              const SizedBox(height: 30),

              _item(
                "Edit Profile",
                Icons.edit,
                () => Get.toNamed('/edit-profile'),
              ),
              _item("Settings", Icons.settings, () => Get.toNamed('/settings')),
              _item("My Bookings", Icons.calendar_month, () {}),
              _item("Documents", Icons.folder, () {}),
              _item(
                "Logout",
                Icons.logout,
                controller.showLogoutSheet,
                isDanger: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _item(
    String title,
    IconData icon,
    VoidCallback onTap, {
    bool isDanger = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: isDanger ? Colors.redAccent : Colors.white),
        title: Text(
          title,
          style: TextStyle(
            color: isDanger ? Colors.redAccent : Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.white70,
        ),
      ),
    );
  }
}
