import 'package:chat_app/core/helpers/font_weight_helper.dart';
import 'package:chat_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'widgets/chats_list_view.dart';
import 'widgets/chats_top_bar.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20).copyWith(bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ChatsTopBar(),
          const SizedBox(height: 10),
          Text(
            'R E C E N T',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.darkPrimary.withValues(alpha: 0.58),
              fontWeight: FontWeightHelper.medium,
            ),
          ),
          const SizedBox(height: 25),
          const Expanded(child: ChatsListView()),
        ],
      ),
    );
  }
}
