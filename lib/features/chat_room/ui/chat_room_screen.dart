import 'package:flutter/material.dart';

import 'widgets/chat_room_top_bar.dart';
import 'widgets/custom_send_message_field.dart';
import 'widgets/messages_list_view.dart';

class ChatRoomScreen extends StatelessWidget {
  const ChatRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20).copyWith(bottom: 0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChatRoomTopBar(),
              SizedBox(height: 20),
              Expanded(child: MessagesListView()),
              CustomSendMessageField(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
