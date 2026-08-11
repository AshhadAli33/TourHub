import 'package:flutter/material.dart';
import '../../models/chat_conversation.dart';
import '../../utils/app_colors.dart';
import '../../utils/chat_time_format.dart';
import '../common/network_post_image.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;
  final bool showAvatar;
  final String? avatarUrl;

  const ChatBubble({
    super.key,
    required this.message,
    this.showAvatar = false,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    final isMe = message.isMe;

    final bubble = Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context).width * 0.68,
      ),
      decoration: BoxDecoration(
        gradient: isMe
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.secondaryColor,
                  AppColors.secondaryColor.withValues(alpha: 0.78),
                ],
              )
            : null,
        color: isMe ? null : AppColors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(16),
          topRight: const Radius.circular(16),
          bottomLeft: Radius.circular(isMe ? 16 : 4),
          bottomRight: Radius.circular(isMe ? 4 : 16),
        ),
        border: isMe
            ? null
            : Border.all(color: AppColors.white.withValues(alpha: 0.15)),
        boxShadow: isMe
            ? [
                BoxShadow(
                  color: AppColors.secondaryColor.withValues(alpha: 0.25),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message.text,
            style: TextStyle(
              color: isMe ? AppColors.primaryColor : AppColors.white,
              fontSize: 14,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                formatMessageTime(message.time),
                style: TextStyle(
                  color: isMe
                      ? AppColors.primaryColor.withValues(alpha: 0.6)
                      : AppColors.white54,
                  fontSize: 10,
                ),
              ),
              if (isMe) ...[
                const SizedBox(width: 4),
                Icon(
                  Icons.done_all_rounded,
                  size: 13,
                  color: AppColors.primaryColor.withValues(alpha: 0.7),
                ),
              ],
            ],
          ),
        ],
      ),
    );

    if (isMe) {
      return Align(alignment: Alignment.centerRight, child: bubble);
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 26,
          child: showAvatar && avatarUrl != null
              ? ClipOval(
                  child: NetworkPostImage(
                    imageUrl: avatarUrl!,
                    height: 26,
                    width: 26,
                  ),
                )
              : null,
        ),
        const SizedBox(width: 8),
        Flexible(child: bubble),
      ],
    );
  }
}
