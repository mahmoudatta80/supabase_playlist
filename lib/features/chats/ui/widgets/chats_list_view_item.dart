import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helpers/font_weight_helper.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/utils/app_colors.dart';

class ChatsListViewItem extends StatelessWidget {
  const ChatsListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.chatRoomScreen);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 26,
            backgroundImage: AssetImage('assets/images/chat.png'),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Danny Hopkins',
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.darkPrimary,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  'Hey, how are you?',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.darkOnSecondary,
                    fontWeight: FontWeightHelper.regular,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Text(
            '08:43',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.darkOnSecondary,
              fontWeight: FontWeightHelper.regular,
            ),
          ),
        ],
      ),
    );
  }
}
