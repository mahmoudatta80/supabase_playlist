import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/font_weight_helper.dart';
import '../../../../core/utils/app_colors.dart';

class UsersTopBar extends StatelessWidget {
  const UsersTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Users',
          style: TextStyle(
            fontSize: 28,
            color: AppColors.darkPrimary,
            fontWeight: FontWeightHelper.semiBold,
          ),
        ),
        SvgPicture.asset('assets/svgs/search.svg'),
      ],
    );
  }
}
