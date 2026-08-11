import 'package:get/get.dart';
import '../../models/chat_conversation.dart';

class ChatsController extends GetxController {
  final conversations = chatConversations.obs;
  final searchQuery = ''.obs;

  List<ChatConversation> get onlineConversations =>
      conversations.where((c) => c.online).toList();

  List<ChatConversation> get filteredConversations {
    final query = searchQuery.value.trim().toLowerCase();
    if (query.isEmpty) return conversations;
    return conversations
        .where((c) => c.name.toLowerCase().contains(query))
        .toList();
  }

  int get totalUnread =>
      conversations.fold(0, (sum, c) => sum + c.unreadCount);

  void updateSearch(String value) => searchQuery.value = value;
}
