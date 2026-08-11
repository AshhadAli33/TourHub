import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/bottom_navigation_bar/bottom_nav_controller.dart';
import '../../utils/app_colors.dart';
import '../../widgets/bottom_navigation_bar/custom_bottom_nav_bar.dart';
import '../../widgets/common/responsive_center.dart';
import '../booking/booking_view.dart';
import '../chats/chats_view.dart';
import '../profile/profile_view.dart';
import 'home_tab_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final BottomNavController controller = Get.find<BottomNavController>();

  // Built lazily so a tab's widget (and any controller it creates) is only
  // constructed the first time the user actually switches to it.
  final List<Widget Function()> pageBuilders = [
    () => const HomeTabView(),
    () => BookingView(),
    () => ChatsView(),
    () => ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.transparent,

      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: AppColors.onboardingGradient),
            child: Obx(() => pageBuilders[controller.currentIndex.value]()),
          ),

          const ResponsiveCenter(
            alignment: Alignment.bottomCenter,
            maxWidth: 500,
            child: CustomBottomNavBar(),
          ),
        ],
      ),
    );
  }
}
