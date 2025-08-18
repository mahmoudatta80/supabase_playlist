import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helpers/font_weight_helper.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../widgets/register/already_have_an_account.dart';
import '../widgets/register/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create an Account',
                  style: TextStyle(
                    fontSize: 28,
                    color: AppColors.darkPrimary,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                ),
                const SizedBox(height: 30),
                const RegisterForm(),
                const SizedBox(height: 30),
                AppElevatedButton(
                  label: 'Register',
                  onPressed: () {
                    GoRouter.of(context).pushReplacement(AppRoutes.loginScreen);
                  },
                ),
                const SizedBox(height: 20),
                const AlreadyHaveAnAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
