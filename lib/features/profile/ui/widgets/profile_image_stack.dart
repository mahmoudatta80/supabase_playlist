import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class ProfileImageStack extends StatelessWidget {
  final String? avatarUrl;
  const ProfileImageStack({super.key, this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        avatarUrl != null
            ? Container(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: CachedNetworkImage(
                  imageUrl: avatarUrl!,
                  height: 140,
                  width: 140,
                  fit: BoxFit.fill,
                ),
              )
            : const CircleAvatar(
                backgroundColor: AppColors.darkSecondaryVariant,
                radius: 70,
                child: Icon(
                  Icons.person,
                  size: 100,
                  color: AppColors.darkBackground,
                ),
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
