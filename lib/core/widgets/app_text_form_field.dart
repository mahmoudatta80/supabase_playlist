import 'package:flutter/material.dart';

import '../helpers/font_weight_helper.dart';
import '../utils/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool? readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;

  const AppTextFormField({
    super.key,
    required this.label,
    required this.controller,
    this.readOnly,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: AppColors.darkPrimary,
          fontSize: 16,
          fontWeight: FontWeightHelper.semiBold,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.darkSecondary),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      style: TextStyle(
        color: AppColors.darkPrimary,
        fontSize: 16,
        fontWeight: FontWeightHelper.semiBold,
      ),
      readOnly: readOnly ?? false,
    );
  }
}
