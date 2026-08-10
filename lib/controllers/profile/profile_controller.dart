import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/user_model.dart';
import '../../routes/app_routes.dart';
import '../../services/auth_service.dart';
import '../../utils/app_colors.dart';

class ProfileController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  late final Rx<UserModel?> user;

  @override
  void onInit() {
    super.onInit();
    final currentUser = _authService.currentUser;
    user = Rx<UserModel?>(
      currentUser != null ? UserModel.fromFirebaseUser(currentUser) : null,
    );
  }

  void showLogoutSheet() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: AppColors.onboardingGradient,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Logout",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryColor,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Are you sure you want to logout?",
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.textcolor, fontSize: 16),
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.overlayGrey.withValues(
                        alpha: 0.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: AppColors.textcolor),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      await _authService.logout();
                      Get.offAllNamed(AppRoutes.login);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      "Logout",
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
}
