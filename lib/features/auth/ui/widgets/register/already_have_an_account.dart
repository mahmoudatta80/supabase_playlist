import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helpers/font_weight_helper.dart';
import '../../../../../core/routing/app_routes.dart';
import '../../../../../core/utils/app_colors.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Already have an account? ',
        style: TextStyle(
          color: AppColors.darkPrimary,
          fontSize: 16,
          fontWeight: FontWeightHelper.regular,
        ),
        children: [
          TextSpan(
            text: 'Login',
            style: TextStyle(
              color: AppColors.darkOnSecondary,
              fontWeight: FontWeightHelper.semiBold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                GoRouter.of(context).pushReplacement(AppRoutes.loginScreen);
              },
          ),
        ],
      ),
    );
  }
}
