import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/tour_post.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_colors.dart';
import '../common/network_post_image.dart';

class TourListTile extends StatelessWidget {
  final TourPost post;

  const TourListTile({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.tourDetails, arguments: post),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.white.withValues(alpha: 0.15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Post header — avatar, author + location, more menu.
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
                  child: Row(
                    children: [
                      ClipOval(
                        child: NetworkPostImage(
                          imageUrl: post.authorAvatarUrl,
                          height: 38,
                          width: 38,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post.authorName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_rounded,
                                  size: 12,
                                  color: AppColors.white54,
                                ),
                                const SizedBox(width: 2),
                                Expanded(
                                  child: Text(
                                    post.location,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: AppColors.white54,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.more_horiz_rounded,
                        color: AppColors.white54,
                      ),
                    ],
                  ),
                ),

                // Post image with a price badge, Instagram-style full-bleed photo.
                Stack(
                  children: [
                    NetworkPostImage(
                      imageUrl: post.imageUrl,
                      height: 260,
                      width: double.infinity,
                    ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withValues(
                            alpha: 0.75,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "\$${post.price.toStringAsFixed(0)}",
                          style: TextStyle(
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Action row — like, comment, share, bookmark.
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite_border_rounded,
                        color: AppColors.white,
                      ),
                      const SizedBox(width: 14),
                      Icon(
                        Icons.mode_comment_outlined,
                        color: AppColors.white,
                        size: 22,
                      ),
                      const SizedBox(width: 14),
                      Icon(
                        Icons.send_outlined,
                        color: AppColors.white,
                        size: 21,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            size: 16,
                            color: AppColors.secondaryColor,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            post.rating.toStringAsFixed(1),
                            style: TextStyle(
                              color: AppColors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.bookmark_border_rounded,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ),

                // Likes, caption, comment count, timestamp.
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 8, 14, 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${post.likes} likes",
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          style: TextStyle(
                            color: AppColors.white70,
                            fontSize: 13,
                          ),
                          children: [
                            TextSpan(
                              text: "${post.title}  ",
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(text: post.caption),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "View all ${post.comments} comments",
                        style: TextStyle(
                          color: AppColors.white54,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        post.postedAgo,
                        style: TextStyle(
                          color: AppColors.white54,
                          fontSize: 10,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
