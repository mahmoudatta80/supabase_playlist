import 'package:flutter/material.dart';

import '../../../../core/helpers/font_weight_helper.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/login/dont_have_an_account.dart';
import '../widgets/login/login_button.dart';
import '../widgets/login/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 28,
                    color: AppColors.darkPrimary,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                ),
                const SizedBox(height: 30),
                const LoginForm(),
                const SizedBox(height: 30),
                const LoginButton(),
                const SizedBox(height: 20),
                const DontHaveAnAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
