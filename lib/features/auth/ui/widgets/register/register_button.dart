import 'package:chat_app/core/utils/app_snack_bars.dart';
import 'package:chat_app/features/auth/logic/create_user_cubit/create_user_cubit.dart';
import 'package:chat_app/features/auth/logic/create_user_cubit/create_user_states.dart';
import 'package:chat_app/features/auth/logic/register_cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/app_routes.dart';
import '../../../../../core/widgets/app_elevated_button.dart';
import '../../../logic/register_cubit/register_cubit.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<RegisterCubit, RegisterStates>(
          listener: (context, state) {
            if (state is RegisterSuccessState) {
              context.read<CreateUserCubit>().createUser(state.userModel);
            }
            if (state is RegisterErrorState) {
              AppSnackBars.showErrorSnackBar(
                context: context,
                message: state.errorMessage,
              );
            }
          },
        ),
        BlocListener<CreateUserCubit, CreateUserStates>(
          listener: (context, state) {
            if (state is CreateUserSuccessState) {
              AppSnackBars.showSuccessSnackBar(
                context: context,
                message: 'User created successfully',
              );
              GoRouter.of(context).pushReplacement(AppRoutes.loginScreen);
            }
            if (state is CreateUserErrorState) {
              AppSnackBars.showErrorSnackBar(
                context: context,
                message: state.errorMessage,
              );
            }
          },
        ),
      ],
      child: BlocBuilder<RegisterCubit, RegisterStates>(
        builder: (context, registerState) {
          return BlocBuilder<CreateUserCubit, CreateUserStates>(
            builder: (context, createUserState) {
              return AppElevatedButton(
                label: 'Register',
                isLoading:
                    registerState is RegisterLoadingState ||
                    (registerState is RegisterSuccessState &&
                        createUserState is! CreateUserErrorState),
                onPressed: () {
                  context.read<RegisterCubit>().register();
                },
              );
            },
          );
        },
      ),
    );
  }
}

// call register
// emit register loading
// either register success or (register failure => snack bar with error message)
// call create user
// either (create user success => navigate login screen) or (create user failure => snack bar with error message)
