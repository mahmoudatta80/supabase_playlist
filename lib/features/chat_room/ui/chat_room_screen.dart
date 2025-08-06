import 'package:chat_app/core/helpers/font_weight_helper.dart';
import 'package:chat_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'widgets/chat_room_top_bar.dart';
import 'widgets/custom_send_message_field.dart';

class ChatRoomScreen extends StatelessWidget {
  const ChatRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20).copyWith(bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ChatRoomTopBar(),
              const SizedBox(height: 40),
              Expanded(
                child: ListView.separated(
                  itemCount: 20,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: index == 19 ? 20 : 0),
                      child: _buildMessage(
                        context: context,
                        isMe: index % 2 == 0,
                        message: 'Message $index',
                      ),
                    );
                  },
                ),
              ),
              const CustomSendMessageField(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessage({
    required BuildContext context,
    required bool isMe,
    required String message,
  }) {
    return Align(
      alignment: isMe
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.7,
        ),
        decoration: BoxDecoration(
          color: isMe
              ? AppColors.darkSecondaryVariant
              : AppColors.darkSecondary,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
        child: Text(
          message,
          style: TextStyle(
            color: AppColors.darkPrimary,
            fontSize: 14,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
      ),
    );
  }
}
