import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/bottom_navigation_bar/bottom_nav_controller.dart';
import '../../controllers/profile/profile_controller.dart';
import '../../utils/app_snackbar.dart';
import '../../widgets/common/gradient_scaffold.dart';
import '../../widgets/common/responsive_center.dart';
import '../../widgets/profile/profile_header.dart';
import '../../widgets/profile/profile_menu_tile.dart';
import '../../widgets/profile/profile_section_card.dart';
import '../../widgets/profile/profile_stat_card.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: ResponsiveCenter(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 130),
          child: Column(
            children: [
              Obx(() => ProfileHeader(user: controller.user.value)),
              const SizedBox(height: 24),
              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: ProfileStatCard(
                        icon: Icons.airplane_ticket_rounded,
                        label: "Trips",
                        value: "${controller.tripsCount}",
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ProfileStatCard(
                        icon: Icons.public_rounded,
                        label: "Countries",
                        value: "${controller.countriesCount}",
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ProfileStatCard(
                        icon: Icons.payments_rounded,
                        label: "Spent",
                        value:
                            "\$${controller.totalSpent.toStringAsFixed(0)}",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 26),

              ProfileSectionCard(
                title: "Account",
                children: [
                  ProfileMenuTile(
                    title: "Edit Profile",
                    subtitle: "Name, photo & personal details",
                    icon: Icons.edit_rounded,
                    onTap: () => Get.toNamed('/edit-profile'),
                  ),
                  ProfileMenuTile(
                    title: "My Bookings",
                    subtitle: "View your trips & tickets",
                    icon: Icons.calendar_month_rounded,
                    onTap: () =>
                        Get.find<BottomNavController>().changeIndex(1),
                  ),
                  ProfileMenuTile(
                    title: "Documents",
                    subtitle: "Passports, visas & travel docs",
                    icon: Icons.folder_rounded,
                    onTap: () => AppSnackbar.info(
                      "Coming Soon",
                      "Document management is on its way.",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              ProfileSectionCard(
                title: "Preferences",
                children: [
                  ProfileMenuTile(
                    title: "Settings",
                    subtitle: "Notifications & appearance",
                    icon: Icons.settings_rounded,
                    onTap: () => Get.toNamed('/settings'),
                  ),
                  ProfileMenuTile(
                    title: "Help & Support",
                    subtitle: "FAQs and contact us",
                    icon: Icons.headset_mic_rounded,
                    onTap: () => AppSnackbar.info(
                      "Coming Soon",
                      "Help & support is on its way.",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              ProfileSectionCard(
                children: [
                  ProfileMenuTile(
                    title: "Logout",
                    icon: Icons.logout_rounded,
                    onTap: controller.showLogoutSheet,
                    isDanger: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
