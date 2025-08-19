import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../logic/register_cubit/register_cubit.dart';
import '../password_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();
    return Column(
      children: [
        AppTextFormField(
          label: 'Name',
          controller: registerCubit.nameController,
          prefixIcon: const Icon(Icons.person, color: AppColors.darkPrimary),
        ),
        const SizedBox(height: 20),
        AppTextFormField(
          label: 'Email',
          controller: registerCubit.emailController,
          prefixIcon: const Icon(Icons.email, color: AppColors.darkPrimary),
        ),
        const SizedBox(height: 20),
        PasswordField(controller: registerCubit.passwordController),
      ],
    );
  }
}
