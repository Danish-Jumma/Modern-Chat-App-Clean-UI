import 'package:chat_app/controller/chat_controller.dart';
import 'package:chat_app/model/chatUser_model.dart';
import 'package:flutter/material.dart';
import '../widgets/chat_app_bar.dart';
import '../widgets/message_bubble.dart';
import '../widgets/message_input.dart';

class ChatView extends StatefulWidget {
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  late ChatController _chatController;

  @override
  void initState() {
    super.initState();
    _initializeChatController();
  }

  void _initializeChatController() {
    final currentUser = ChatUser(
      id: 'user1',
      name: 'You',
      avatar:
          'https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?cs=srgb&dl=pexels-olly-733872.jpg&fm=jpg',
      isOnline: true,
    );

    final otherUser = ChatUser(
      id: 'user2',
      name: 'Sarah Johnson',
      avatar:
          'https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fwww.gravatar.com%2Favatar%2F2c7d99fe281ecd3bcd65ab915bac6dd5%3Fs%3D250',
      isOnline: true,
    );

    _chatController = ChatController(
      currentUser: currentUser,
      otherUser: otherUser,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: ChatAppBar(
        user: _chatController.otherUser,
        onVideoCall: _handleVideoCall,
        onVoiceCall: _handleVoiceCall,
        onMoreOptions: _handleMoreOptions,
      ),
      body: Column(
        children: [
          Expanded(
            child: AnimatedBuilder(
              animation: _chatController,
              builder: (context, child) {
                return ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: _chatController.messages.length,
                  itemBuilder: (context, index) {
                    return MessageBubble(
                      message: _chatController.messages[index],
                    );
                  },
                );
              },
            ),
          ),
          MessageInput(
            onSendMessage: _chatController.sendMessage,
            onAttachFile: _handleAttachFile,
          ),
        ],
      ),
    );
  }

  void _handleVideoCall() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Starting video call...')));
  }

  void _handleVoiceCall() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Starting voice call...')));
  }

  void _handleMoreOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 200,
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Chat Info'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.block),
              title: Text('Block User'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Report'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  void _handleAttachFile() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Attach file functionality coming soon!')),
    );
  }

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }
}
