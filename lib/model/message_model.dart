class Message {
  final String id;
  final String text;
  final bool isMe;
  final DateTime timestamp;
  final bool isRead;
  final String senderName;
  final String senderAvatar;

  Message({
    required this.id,
    required this.text,
    required this.isMe,
    required this.timestamp,
    required this.senderName,
    required this.senderAvatar,
    this.isRead = false,
  });

  Message copyWith({
    String? id,
    String? text,
    bool? isMe,
    DateTime? timestamp,
    bool? isRead,
    String? senderName,
    String? senderAvatar,
  }) {
    return Message(
      id: id ?? this.id,
      text: text ?? this.text,
      isMe: isMe ?? this.isMe,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
      senderName: senderName ?? this.senderName,
      senderAvatar: senderAvatar ?? this.senderAvatar,
    );
  }
}
