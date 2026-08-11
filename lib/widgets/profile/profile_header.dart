import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/user_model.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_colors.dart';
import '../common/network_post_image.dart';

class ProfileHeader extends StatelessWidget {
  final UserModel? user;

  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.secondaryColor, AppColors.success],
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
                child: user?.photoUrl != null
                    ? ClipOval(
                        child: NetworkPostImage(
                          imageUrl: user!.photoUrl!,
                          height: 94,
                          width: 94,
                        ),
                      )
                    : Container(
                        height: 94,
                        width: 94,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white24,
                        ),
                        child: const Icon(
                          Icons.person_rounded,
                          size: 46,
                          color: AppColors.white,
                        ),
                      ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 2,
              child: GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.editProfile),
                child: Container(
                  height: 32,
                  width: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primaryColor,
                      width: 3,
                    ),
                  ),
                  child: const Icon(
                    Icons.edit_rounded,
                    size: 15,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          user?.name?.trim().isNotEmpty == true ? user!.name! : "Explorer",
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          user?.email ?? "user@email.com",
          style: TextStyle(color: AppColors.white70),
        ),
        if (user?.memberSince != null) ...[
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.white12,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.white.withValues(alpha: 0.15),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.workspace_premium_rounded,
                  size: 14,
                  color: AppColors.secondaryColor,
                ),
                const SizedBox(width: 6),
                Text(
                  "Member since ${user!.memberSince!.year}",
                  style: TextStyle(color: AppColors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
