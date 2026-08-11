import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/chats/chats_controller.dart';
import '../../models/chat_conversation.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_colors.dart';
import '../../widgets/chats/chat_list_tile.dart';
import '../../widgets/common/gradient_scaffold.dart';
import '../../widgets/common/network_post_image.dart';
import '../../widgets/common/responsive_center.dart';

class ChatsView extends StatelessWidget {
  ChatsView({super.key});

  final controller = Get.put(ChatsController());

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: ResponsiveCenter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              _buildHeader(),
              const SizedBox(height: 18),
              _buildSearchBar(),
              Expanded(
                child: Obx(() {
                  final query = controller.searchQuery.value.trim();
                  final online = controller.onlineConversations;
                  final conversations = controller.filteredConversations;
                  final showOnlineRow = query.isEmpty && online.isNotEmpty;

                  if (conversations.isEmpty && !showOnlineRow) {
                    return _buildEmptyState();
                  }

                  return ListView(
                    padding: const EdgeInsets.only(top: 20, bottom: 120),
                    children: [
                      if (showOnlineRow) _buildOnlineStories(online),
                      if (conversations.isEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: _buildEmptyState(),
                        )
                      else
                        ...conversations.map(
                          (c) => ChatListTile(conversation: c),
                        ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Chats",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 44,
              width: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.white12,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.mark_chat_unread_rounded,
                color: AppColors.white,
              ),
            ),
            Obx(() {
              final total = controller.totalUnread;
              if (total == 0) return const SizedBox.shrink();
              return Positioned(
                top: -4,
                right: -4,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  constraints: const BoxConstraints(
                    minWidth: 20,
                    minHeight: 20,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.secondaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "$total",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white12,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.white.withValues(alpha: 0.12)),
      ),
      child: TextField(
        onChanged: controller.updateSearch,
        style: const TextStyle(color: AppColors.white, fontSize: 14),
        decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          hintText: "Search conversations",
          hintStyle: TextStyle(color: AppColors.white54),
          icon: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.search_rounded, color: AppColors.white54),
          ),
        ),
      ),
    );
  }

  Widget _buildOnlineStories(List<ChatConversation> online) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Online Now",
          style: TextStyle(
            color: AppColors.white70,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 84,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: online.length,
            separatorBuilder: (_, _) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              final conversation = online[index];
              return GestureDetector(
                onTap: () =>
                    Get.toNamed(AppRoutes.chatDetail, arguments: conversation),
                child: SizedBox(
                  width: 60,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2.5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              AppColors.secondaryColor,
                              AppColors.success,
                            ],
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                          child: ClipOval(
                            child: NetworkPostImage(
                              imageUrl: conversation.avatarUrl,
                              height: 48,
                              width: 48,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        conversation.name.split(" ").first,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: AppColors.white70, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 88,
            width: 88,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.white12,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.chat_bubble_outline_rounded,
              color: AppColors.white54,
              size: 38,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "No conversations found",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Try a different search",
            style: TextStyle(color: AppColors.white54, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
