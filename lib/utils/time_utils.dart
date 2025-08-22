class TimeUtils {
  static String formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inMinutes < 1) {
      return 'Now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h';
    } else {
      return '${time.day}/${time.month}';
    }
  }

  static String formatLastSeen(DateTime? lastSeen) {
    if (lastSeen == null) return 'Last seen a while ago';

    final difference = DateTime.now().difference(lastSeen);

    if (difference.inMinutes < 5) {
      return 'Last seen just now';
    } else if (difference.inHours < 1) {
      return 'Last seen ${difference.inMinutes} minutes ago';
    } else if (difference.inDays < 1) {
      return 'Last seen ${difference.inHours} hours ago';
    } else {
      return 'Last seen ${difference.inDays} days ago';
    }
  }
}
