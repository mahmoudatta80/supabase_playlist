import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../logic/login_cubit/login_cubit.dart';
import '../password_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return Column(
      children: [
        AppTextFormField(
          label: 'Email',
          controller: loginCubit.emailController,
          prefixIcon: const Icon(Icons.email, color: AppColors.darkPrimary),
        ),
        const SizedBox(height: 20),
        PasswordField(controller: loginCubit.passwordController),
      ],
    );
  }
}
