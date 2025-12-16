import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/bottom_navigation_bar/bottom_nav_controller.dart';
import '../../utils/app_colors.dart';
import '../../widgets/bottom_navigation_bar/custom_bottom_nav_bar.dart';
import '../booking/booking_view.dart';
import '../chats/chats_view.dart';
import '../profile/profile_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final BottomNavController controller = Get.put(BottomNavController());

  final List<Widget> pages = [
    Center(
      child: Text("Home", style: TextStyle(color: Colors.white, fontSize: 24)),
    ),
    BookingView(),
    ChatsView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,

      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: AppColors.onboardingGradient),
            child: Obx(() => pages[controller.currentIndex.value]),
          ),

          const Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavBar(),
          ),
        ],
      ),
    );
  }
}
