class ChatUser {
  final String id;
  final String name;
  final String avatar;
  final bool isOnline;
  final DateTime? lastSeen;

  ChatUser({
    required this.id,
    required this.name,
    required this.avatar,
    this.isOnline = false,
    this.lastSeen,
  });
}
