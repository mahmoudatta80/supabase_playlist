import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AppElevatedButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;

  const AppElevatedButton({super.key, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkPrimary,
        foregroundColor: AppColors.darkBackground,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(label),
    );
  }
}
