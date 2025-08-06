import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../password_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        ),
        const SizedBox(height: 20),
        PasswordField(controller: TextEditingController()),
      ],
    );
  }
}
