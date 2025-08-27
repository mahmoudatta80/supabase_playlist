import 'package:chat_app/core/utils/app_snack_bars.dart';
import 'package:chat_app/features/profile/logic/logout_cubit/logout_cubit.dart';
import 'package:chat_app/features/profile/logic/logout_cubit/logout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/app_elevated_button.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutCubit, LogoutStates>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          AppSnackBars.showSuccessSnackBar(
            context: context,
            message: 'Logged out successfully',
          );
          GoRouter.of(context).go(AppRoutes.loginScreen);
        } else if (state is LogoutFailure) {
          AppSnackBars.showErrorSnackBar(
            context: context,
            message: state.errorMessage,
          );
        }
      },
      builder: (context, state) {
        return AppElevatedButton(
          onPressed: () {
            context.read<LogoutCubit>().logout();
          },
          isLoading: state is LogoutLoading,
          label: 'Logout',
        );
      },
    );
  }
}
