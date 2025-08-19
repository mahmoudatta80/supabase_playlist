import 'package:chat_app/core/utils/app_snack_bars.dart';
import 'package:chat_app/features/auth/logic/login_cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/app_routes.dart';
import '../../../../../core/widgets/app_elevated_button.dart';
import '../../../logic/login_cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          AppSnackBars.showErrorSnackBar(
            context: context,
            message: state.errorMessage,
          );
        }
        if (state is LoginSuccessState) {
          AppSnackBars.showSuccessSnackBar(
            context: context,
            message: 'login successfully',
          );
          GoRouter.of(context).go(AppRoutes.layoutScreen);
        }
      },
      builder: (context, state) {
        return AppElevatedButton(
          label: 'Login',
          isLoading: state is LoginLoadingState,
          onPressed: () {
            context.read<LoginCubit>().login();
          },
        );
      },
    );
  }
}
