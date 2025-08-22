import 'package:chat_app/model/chatUser_model.dart';
import 'package:chat_app/model/message_model.dart';
import 'package:flutter/material.dart';

class ChatController extends ChangeNotifier {
  final List<Message> _messages = [];
  final ChatUser currentUser;
  final ChatUser otherUser;
  bool _isTyping = false;

  ChatController({required this.currentUser, required this.otherUser}) {
    _initializeMessages();
  }

  List<Message> get messages => List.unmodifiable(_messages);
  bool get isTyping => _isTyping;

  void _initializeMessages() {
    _messages.addAll([
      Message(
        id: '1',
        text: "Hey! How's your day going? 😊",
        isMe: false,
        timestamp: DateTime.now().subtract(Duration(minutes: 30)),
        senderName: otherUser.name,
        senderAvatar: otherUser.avatar,
        isRead: true,
      ),
      Message(
        id: '2',
        text:
            "Pretty good! Just working on some new Flutter projects. How about you?",
        isMe: true,
        timestamp: DateTime.now().subtract(Duration(minutes: 28)),
        senderName: currentUser.name,
        senderAvatar: currentUser.avatar,
        isRead: true,
      ),
      Message(
        id: '3',
        text: "That sounds awesome! I'd love to see what you're building 🚀",
        isMe: false,
        timestamp: DateTime.now().subtract(Duration(minutes: 25)),
        senderName: otherUser.name,
        senderAvatar: otherUser.avatar,
        isRead: true,
      ),
      Message(
        id: '4',
        text:
            "I'll share some screenshots later! Working on a really cool chat app design",
        isMe: true,
        timestamp: DateTime.now().subtract(Duration(minutes: 20)),
        senderName: currentUser.name,
        senderAvatar: currentUser.avatar,
        isRead: true,
      ),
    ]);
  }

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    final message = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text.trim(),
      isMe: true,
      timestamp: DateTime.now(),
      senderName: currentUser.name,
      senderAvatar: currentUser.avatar,
    );

    _messages.add(message);
    notifyListeners();

    // Simulate message being read after a delay
    Future.delayed(Duration(seconds: 2), () {
      markMessageAsRead(message.id);
    });
  }

  void markMessageAsRead(String messageId) {
    final index = _messages.indexWhere((msg) => msg.id == messageId);
    if (index != -1) {
      _messages[index] = _messages[index].copyWith(isRead: true);
      notifyListeners();
    }
  }

  void setTyping(bool typing) {
    _isTyping = typing;
    notifyListeners();
  }

  void dispose() {
    super.dispose();
  }
}
