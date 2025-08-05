import 'package:chat_app/core/helpers/font_weight_helper.dart';
import 'package:chat_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'widgets/users_list_view.dart';
import 'widgets/users_top_bar.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20).copyWith(bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UsersTopBar(),
          const SizedBox(height: 10),
          Text(
            'U S E R S',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.darkPrimary.withValues(alpha: 0.58),
              fontWeight: FontWeightHelper.medium,
            ),
          ),
          const SizedBox(height: 25),
          const Expanded(child: UsersListView()),
        ],
      ),
    );
  }
}
