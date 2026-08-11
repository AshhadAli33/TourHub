import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/chats/chat_detail_controller.dart';
import '../../models/chat_conversation.dart';
import '../../utils/app_colors.dart';
import '../../utils/chat_time_format.dart';
import '../../widgets/chats/chat_bubble.dart';
import '../../widgets/chats/date_separator.dart';
import '../../widgets/chats/typing_indicator.dart';
import '../../widgets/common/gradient_scaffold.dart';
import '../../widgets/common/network_post_image.dart';
import '../../widgets/common/responsive_center.dart';

class ChatDetailView extends StatelessWidget {
  final ChatConversation conversation;

  ChatDetailView({super.key, required this.conversation});

  late final ChatDetailController controller = Get.put(
    ChatDetailController(conversation),
    tag: conversation.id,
  );

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: ResponsiveCenter(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(child: _buildMessageList()),
            _buildInputBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageList() {
    return Obx(() {
      final messages = controller.messages;
      final typing = controller.isTyping.value;
      final itemCount = messages.length + (typing ? 1 : 0);

      return ListView.builder(
        controller: controller.scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          if (index >= messages.length) {
            return TypingIndicator(avatarUrl: conversation.avatarUrl);
          }

          final message = messages[index];
          final previous = index > 0 ? messages[index - 1] : null;
          final next = index < messages.length - 1
              ? messages[index + 1]
              : null;

          final showDateSeparator =
              previous == null || !isSameDay(previous.time, message.time);
          final isLastInGroup =
              next == null ||
              next.isMe != message.isMe ||
              !isSameDay(next.time, message.time);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (showDateSeparator) DateSeparator(date: message.time),
              ChatBubble(
                message: message,
                showAvatar: !message.isMe && isLastInGroup,
                avatarUrl: conversation.avatarUrl,
              ),
            ],
          );
        },
      );
    });
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.white,
              size: 20,
            ),
          ),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: conversation.online
                      ? const LinearGradient(
                          colors: [
                            AppColors.secondaryColor,
                            AppColors.success,
                          ],
                        )
                      : null,
                ),
                child: ClipOval(
                  child: NetworkPostImage(
                    imageUrl: conversation.avatarUrl,
                    height: 42,
                    width: 42,
                  ),
                ),
              ),
              if (conversation.online)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 11,
                    width: 11,
                    decoration: BoxDecoration(
                      color: AppColors.success,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  conversation.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Obx(() {
                  final typing = controller.isTyping.value;
                  return Text(
                    typing
                        ? "typing..."
                        : (conversation.online ? "Online" : conversation.role),
                    style: TextStyle(
                      color: typing || conversation.online
                          ? AppColors.success
                          : AppColors.white54,
                      fontSize: 12,
                      fontStyle: typing ? FontStyle.italic : FontStyle.normal,
                    ),
                  );
                }),
              ],
            ),
          ),
          Container(
            height: 38,
            width: 38,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.white12,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.call_outlined,
              color: AppColors.white,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      child: Row(
        children: [
          Container(
            height: 46,
            width: 46,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.white12,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.white.withValues(alpha: 0.15),
              ),
            ),
            child: const Icon(
              Icons.add_rounded,
              color: AppColors.white,
              size: 22,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.white12,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: AppColors.white.withValues(alpha: 0.15),
                ),
              ),
              child: TextField(
                controller: controller.textController,
                style: const TextStyle(color: AppColors.white),
                minLines: 1,
                maxLines: 4,
                textCapitalization: TextCapitalization.sentences,
                onSubmitted: (_) => controller.sendMessage(),
                decoration: const InputDecoration(
                  hintText: "Type a message...",
                  hintStyle: TextStyle(color: AppColors.white54),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: controller.sendMessage,
            child: Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.secondaryColor, AppColors.success],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.secondaryColor.withValues(alpha: 0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.send_rounded,
                color: AppColors.primaryColor,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
