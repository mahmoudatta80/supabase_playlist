import 'package:flutter/material.dart';

import '../../../../core/helpers/font_weight_helper.dart';
import '../../../../core/utils/app_colors.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 20,
      reverse: true,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: index == 0 ? 20 : 0),
          child: _buildMessage(
            context: context,
            isMe: index % 2 == 0,
            message: 'Message test ${19 - index}',
          ),
        );
      },
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
