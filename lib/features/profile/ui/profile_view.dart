import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/app_text_form_field.dart';
import 'widgets/profile_image_stack.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80),
            const ProfileImageStack(),
            const SizedBox(height: 20),
            AppTextFormField(
              label: 'Name',
              controller: TextEditingController(),
              prefixIcon: const Icon(Icons.person, color: AppColors.darkPrimary),
            ),
            const SizedBox(height: 20),
            AppTextFormField(
              label: 'Email',
              controller: TextEditingController(),
              prefixIcon: const Icon(Icons.email, color: AppColors.darkPrimary),
              readOnly: true,
            ),
          ],
        ),
      ),
    );
  }
}
