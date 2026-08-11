import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/chat_conversation.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_colors.dart';
import '../../utils/chat_time_format.dart';
import '../common/network_post_image.dart';

class ChatListTile extends StatelessWidget {
  final ChatConversation conversation;

  const ChatListTile({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
    final lastMessage = conversation.lastMessage;
    final hasUnread = conversation.unreadCount > 0;

    return GestureDetector(
      onTap: () =>
          Get.toNamed(AppRoutes.chatDetail, arguments: conversation),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.white.withValues(
                  alpha: hasUnread ? 0.14 : 0.08,
                ),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: hasUnread
                      ? AppColors.secondaryColor.withValues(alpha: 0.4)
                      : AppColors.white.withValues(alpha: 0.15),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAvatar(),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                conversation.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: hasUnread
                                      ? FontWeight.bold
                                      : FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            if (lastMessage != null)
                              Text(
                                formatConversationTime(lastMessage.time),
                                style: TextStyle(
                                  color: hasUnread
                                      ? AppColors.secondaryColor
                                      : AppColors.white54,
                                  fontSize: 11,
                                  fontWeight: hasUnread
                                      ? FontWeight.w600
                                      : FontWeight.normal,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (lastMessage != null && lastMessage.isMe)
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 4,
                                  top: 1,
                                ),
                                child: Icon(
                                  Icons.done_all_rounded,
                                  size: 14,
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                            Expanded(
                              child: Text(
                                lastMessage == null
                                    ? conversation.role
                                    : lastMessage.text,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: hasUnread
                                      ? AppColors.white
                                      : AppColors.white70,
                                  fontSize: 13,
                                  fontWeight: hasUnread
                                      ? FontWeight.w600
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                            if (hasUnread) ...[
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 7,
                                  vertical: 2,
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 20,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.secondaryColor,
                                      AppColors.secondaryColor.withValues(
                                        alpha: 0.7,
                                      ),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "${conversation.unreadCount}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: conversation.online
                ? const LinearGradient(
                    colors: [AppColors.secondaryColor, AppColors.success],
                  )
                : null,
            border: conversation.online
                ? null
                : Border.all(color: AppColors.white24, width: 1.5),
          ),
          child: ClipOval(
            child: NetworkPostImage(
              imageUrl: conversation.avatarUrl,
              height: 50,
              width: 50,
            ),
          ),
        ),
        if (conversation.online)
          Positioned(
            right: 1,
            bottom: 1,
            child: Container(
              height: 13,
              width: 13,
              decoration: BoxDecoration(
                color: AppColors.success,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primaryColor, width: 2),
              ),
            ),
          ),
      ],
    );
  }
}
