import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/chat_conversation.dart';

class ChatDetailController extends GetxController {
  final ChatConversation conversation;

  ChatDetailController(this.conversation);

  late final messages = <ChatMessage>[...conversation.messages].obs;
  final textController = TextEditingController();
  final scrollController = ScrollController();
  final isTyping = false.obs;

  void sendMessage() {
    final text = textController.text.trim();
    if (text.isEmpty) return;

    messages.add(ChatMessage(text: text, isMe: true, time: DateTime.now()));
    textController.clear();
    _scrollToBottom();
    _simulateReply();
  }

  void _simulateReply() {
    isTyping.value = true;
    _scrollToBottom();
    Future.delayed(const Duration(milliseconds: 1600), () {
      isTyping.value = false;
      messages.add(
        ChatMessage(
          text: "Thanks for your message! We'll get back to you shortly.",
          isMe: false,
          time: DateTime.now(),
        ),
      );
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (!scrollController.hasClients) return;
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void onClose() {
    textController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
