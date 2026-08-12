import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/tour_post.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_colors.dart';
import '../../widgets/common/network_post_image.dart';

class TourDetailsView extends StatelessWidget {
  final TourPost post;

  const TourDetailsView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.paddingOf(context).top;

    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.onboardingGradient),
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  NetworkPostImage(imageUrl: post.imageUrl),
                  Positioned(
                    top: topInset + 12,
                    left: 16,
                    child: _circleButton(
                      icon: Icons.arrow_back_ios_new_rounded,
                      onTap: () => Get.back(),
                    ),
                  ),
                  Positioned(
                    top: topInset + 12,
                    right: 16,
                    child: _circleButton(
                      icon: Icons.favorite_border_rounded,
                      onTap: () {},
                    ),
                  ),
                  Positioned(
                    right: 16,
                    bottom: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withValues(alpha: 0.75),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "\$${post.price.toStringAsFixed(0)}",
                        style: TextStyle(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 22, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          size: 16,
                          color: AppColors.white54,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          post.location,
                          style: TextStyle(
                            color: AppColors.white54,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.star_rounded,
                          size: 18,
                          color: AppColors.secondaryColor,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          post.rating.toStringAsFixed(1),
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        ClipOval(
                          child: NetworkPostImage(
                            imageUrl: post.authorAvatarUrl,
                            height: 42,
                            width: 42,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.authorName,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "Tour organizer",
                                style: TextStyle(
                                  color: AppColors.white54,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.chat_bubble_outline_rounded,
                          color: AppColors.white70,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "About this tour",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      post.caption,
                      style: TextStyle(
                        color: AppColors.white70,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(
                          Icons.category_rounded,
                          size: 16,
                          color: AppColors.white54,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          post.category,
                          style: TextStyle(
                            color: AppColors.white54,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                20,
                16,
                20,
                16 + MediaQuery.paddingOf(context).bottom,
              ),
              decoration: BoxDecoration(
                color: AppColors.white12,
                border: Border(
                  top: BorderSide(color: AppColors.white.withValues(alpha: 0.1)),
                ),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total price",
                        style: TextStyle(
                          color: AppColors.white54,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "\$${post.price.toStringAsFixed(0)}",
                        style: TextStyle(
                          color: AppColors.secondaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () => Get.toNamed(
                      AppRoutes.tourBooking,
                      arguments: post,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondaryColor,
                      foregroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      "Book Now",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withValues(alpha: 0.55),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.white, size: 18),
      ),
    );
  }
}
