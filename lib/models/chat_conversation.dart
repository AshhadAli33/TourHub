class ChatMessage {
  final String text;
  final bool isMe;
  final DateTime time;

  const ChatMessage({required this.text, required this.isMe, required this.time});
}

class ChatConversation {
  final String id;
  final String name;
  final String avatarUrl;
  final String role;
  final bool online;
  final int unreadCount;
  final List<ChatMessage> messages;

  const ChatConversation({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.role,
    required this.online,
    this.unreadCount = 0,
    required this.messages,
  });

  ChatMessage? get lastMessage => messages.isEmpty ? null : messages.last;
}

final List<ChatConversation> chatConversations = [
  ChatConversation(
    id: "1",
    name: "Alpine Explorers",
    avatarUrl: "https://i.pravatar.cc/150?img=12",
    role: "Tour Guide",
    online: true,
    unreadCount: 2,
    messages: [
      ChatMessage(
        text: "Hi! Thanks for booking the Swiss Alps Adventure 🏔️",
        isMe: false,
        time: DateTime.now().subtract(const Duration(hours: 3, minutes: 10)),
      ),
      ChatMessage(
        text: "We're excited! What should we pack for the trek?",
        isMe: true,
        time: DateTime.now().subtract(const Duration(hours: 3)),
      ),
      ChatMessage(
        text: "Warm layers, waterproof boots, and a good camera 📷",
        isMe: false,
        time: DateTime.now().subtract(const Duration(hours: 2, minutes: 55)),
      ),
      ChatMessage(
        text: "Perfect, see you at the pickup point!",
        isMe: true,
        time: DateTime.now().subtract(const Duration(hours: 2, minutes: 50)),
      ),
    ],
  ),
  ChatConversation(
    id: "2",
    name: "TourHub Travel",
    avatarUrl: "https://i.pravatar.cc/150?img=1",
    role: "Support",
    online: true,
    unreadCount: 0,
    messages: [
      ChatMessage(
        text: "Your Maldives Beach Escape booking is confirmed ✅",
        isMe: false,
        time: DateTime.now().subtract(const Duration(days: 1, hours: 1)),
      ),
      ChatMessage(
        text: "Awesome, thank you!",
        isMe: true,
        time: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ],
  ),
  ChatConversation(
    id: "3",
    name: "Neon Wanderers",
    avatarUrl: "https://i.pravatar.cc/150?img=32",
    role: "Tour Guide",
    online: false,
    unreadCount: 1,
    messages: [
      ChatMessage(
        text: "The Tokyo itinerary has been updated for your dates.",
        isMe: false,
        time: DateTime.now().subtract(const Duration(days: 2, hours: 4)),
      ),
    ],
  ),
  ChatConversation(
    id: "4",
    name: "Dune Riders",
    avatarUrl: "https://i.pravatar.cc/150?img=45",
    role: "Tour Guide",
    online: false,
    unreadCount: 0,
    messages: [
      ChatMessage(
        text: "Looking forward to the Sahara safari with you all 🐫",
        isMe: false,
        time: DateTime.now().subtract(const Duration(days: 5)),
      ),
      ChatMessage(
        text: "Us too! Any last minute tips?",
        isMe: true,
        time: DateTime.now().subtract(const Duration(days: 4, hours: 20)),
      ),
      ChatMessage(
        text: "Stay hydrated and bring sun protection ☀️",
        isMe: false,
        time: DateTime.now().subtract(const Duration(days: 4, hours: 19)),
      ),
    ],
  ),
];
