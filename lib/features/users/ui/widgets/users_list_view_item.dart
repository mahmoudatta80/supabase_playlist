import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helpers/font_weight_helper.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/utils/app_colors.dart';

class UsersListViewItem extends StatelessWidget {
  const UsersListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.chatRoomScreen);
      },
      child: Row(
        children: [
          const CircleAvatar(
            radius: 26,
            backgroundImage: AssetImage('assets/images/chat.png'),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Text(
              'Danny Hopkins',
              style: TextStyle(
                fontSize: 15,
                color: AppColors.darkPrimary,
                fontWeight: FontWeightHelper.semiBold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
