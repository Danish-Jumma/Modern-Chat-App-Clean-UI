import 'package:chat_app/model/message_model.dart';
import 'package:flutter/material.dart';
import '../utils/time_utils.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: message.isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!message.isMe) _buildAvatar(),
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75,
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: _buildBubbleDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.text,
                    style: TextStyle(
                      color: message.isMe ? Colors.white : Colors.black87,
                      fontSize: 16,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 4),
                  _buildMessageInfo(),
                ],
              ),
            ),
          ),
          if (message.isMe) _buildAvatar(),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      margin: EdgeInsets.only(
        left: message.isMe ? 8 : 0,
        right: message.isMe ? 0 : 8,
        bottom: 20,
      ),
      child: CircleAvatar(
        radius: 16,
        backgroundImage: NetworkImage(message.senderAvatar),
      ),
    );
  }

  BoxDecoration _buildBubbleDecoration() {
    return BoxDecoration(
      gradient: message.isMe
          ? LinearGradient(
              colors: [Color(0xFF667eea), Color(0xFF764ba2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
          : null,
      color: message.isMe ? null : Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(message.isMe ? 20 : 4),
        bottomRight: Radius.circular(message.isMe ? 4 : 20),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: Offset(0, 2),
        ),
      ],
    );
  }

  Widget _buildMessageInfo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          TimeUtils.formatTime(message.timestamp),
          style: TextStyle(
            color: message.isMe ? Colors.white70 : Colors.grey[500],
            fontSize: 11,
          ),
        ),
        if (message.isMe) ...[
          SizedBox(width: 4),
          Icon(
            message.isRead ? Icons.done_all : Icons.done,
            size: 14,
            color: message.isRead ? Colors.blue[200] : Colors.white70,
          ),
        ],
      ],
    );
  }
}
