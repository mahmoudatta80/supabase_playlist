import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/dependency_injection.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../auth/data/models/user_model.dart';
import '../../data/repos/profile_repo_impl.dart';
import '../../logic/logout_cubit/logout_cubit.dart';
import 'logout_button.dart';
import 'profile_image_stack.dart';

class ProfileViewBody extends StatelessWidget {
  final UserModel userModel;
  const ProfileViewBody({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        ProfileImageStack(avatarUrl: userModel.avatarUrl),
        const SizedBox(height: 20),
        AppTextFormField(
          label: 'Name',
          controller: TextEditingController(text: userModel.name),
          prefixIcon: const Icon(Icons.person, color: AppColors.darkPrimary),
        ),
        const SizedBox(height: 20),
        AppTextFormField(
          label: 'Email',
          controller: TextEditingController(text: userModel.email),
          prefixIcon: const Icon(Icons.email, color: AppColors.darkPrimary),
          readOnly: true,
        ),
        const SizedBox(height: 30),
        AppElevatedButton(onPressed: () {}, label: 'Edit Profile'),
        const SizedBox(height: 20),
        BlocProvider(
          create: (context) => LogoutCubit(getIt.get<ProfileRepoImpl>()),
          child: const LogoutButton(),
        ),
      ],
    );
  }
}
