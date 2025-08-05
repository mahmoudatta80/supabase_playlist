import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class ProfileImageStack extends StatelessWidget {
  const ProfileImageStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
          backgroundColor: AppColors.darkSecondaryVariant,
          radius: 70,
          child: Icon(Icons.person, size: 100, color: AppColors.darkBackground),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: AppColors.darkPrimary,
              fixedSize: const Size(30, 30),
            ),
            icon: const Icon(Icons.edit, color: AppColors.darkBackground),
          ),
        ),
      ],
    );
  }
}
