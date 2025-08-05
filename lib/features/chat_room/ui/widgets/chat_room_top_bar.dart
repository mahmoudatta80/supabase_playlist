import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helpers/font_weight_helper.dart';

class ChatRoomTopBar extends StatelessWidget {
  const ChatRoomTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => GoRouter.of(context).pop(),
          child: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        const SizedBox(width: 20),
        const CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage('assets/images/chat.png'),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            'Mahmoud Atta',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeightHelper.semiBold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SvgPicture.asset('assets/svgs/search.svg'),
      ],
    );
  }
}
