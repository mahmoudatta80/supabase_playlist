import 'package:flutter/material.dart';

import 'widgets/chat_room_top_bar.dart';

class ChatRoomScreen extends StatelessWidget {
  const ChatRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20).copyWith(bottom: 0),
          child: const Column(children: [ChatRoomTopBar()]),
        ),
      ),
    );
  }
}
