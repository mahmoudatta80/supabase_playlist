import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../password_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          label: 'Email',
          controller: TextEditingController(),
          prefixIcon: const Icon(Icons.email, color: AppColors.darkPrimary),
        ),
        const SizedBox(height: 20),
        PasswordField(
          controller: TextEditingController(),
        ),
      ],
    );
  }
}
