import 'package:chat_app/model/chatUser_model.dart';
import 'package:flutter/material.dart';
import '../utils/time_utils.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ChatUser user;
  final VoidCallback? onVideoCall;
  final VoidCallback? onVoiceCall;
  final VoidCallback? onMoreOptions;

  const ChatAppBar({
    Key? key,
    required this.user,
    this.onVideoCall,
    this.onVoiceCall,
    this.onMoreOptions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: Container(
        margin: EdgeInsets.all(8),
        child: CircleAvatar(backgroundImage: NetworkImage(user.avatar)),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.name,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            user.isOnline ? 'Online' : TimeUtils.formatLastSeen(user.lastSeen),
            style: TextStyle(
              color: user.isOnline ? Colors.green : Colors.grey[500],
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.videocam_rounded, color: Colors.blue[600]),
          onPressed: onVideoCall,
        ),
        IconButton(
          icon: Icon(Icons.call, color: Colors.blue[600]),
          onPressed: onVoiceCall,
        ),
        IconButton(
          icon: Icon(Icons.more_vert, color: Colors.grey[600]),
          onPressed: onMoreOptions,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
