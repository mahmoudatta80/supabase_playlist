import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppSnackBars {
  static void showSuccessSnackBar({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: AppColors.darkBackground),
        ),
        backgroundColor: AppColors.darkPrimary,
      ),
    );
  }

  static void showErrorSnackBar({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: AppColors.darkPrimary),
        ),
        backgroundColor: AppColors.darkError,
      ),
    );
  }
}
