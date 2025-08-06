import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/font_weight_helper.dart';
import '../../../../core/utils/app_colors.dart';

class CustomSendMessageField extends StatelessWidget {
  const CustomSendMessageField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditingController(),
      decoration: InputDecoration(
        hintText: 'Type a message',
        hintStyle: TextStyle(
          color: AppColors.darkPrimary,
          fontSize: 16,
          fontWeight: FontWeightHelper.semiBold,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: AppColors.darkSecondary),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(6.0),
          child: CircleAvatar(
            backgroundColor: AppColors.darkSecondaryVariant,
            radius: 15,
            child: SvgPicture.asset('assets/svgs/camera.svg'),
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(6.0),
          child: SvgPicture.asset('assets/svgs/send.svg'),
        ),
      ),
      style: TextStyle(
        color: AppColors.darkPrimary,
        fontSize: 16,
        fontWeight: FontWeightHelper.semiBold,
      ),
    );
  }
}
