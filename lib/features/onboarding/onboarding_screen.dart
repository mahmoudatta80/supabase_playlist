import 'package:chat_app/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../core/routing/app_routes.dart';
import '../../core/utils/app_shared_preferences.dart';
import '../../core/widgets/app_elevated_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/lottie/onboarding.json',
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 20),
              AppElevatedButton(
                label: 'Get Started',
                onPressed: () async {
                  GoRouter.of(
                    context,
                  ).pushReplacement(AppRoutes.registerScreen);
                  await AppSharedPreferences().setBool(
                    AppConstants.isFirstTimeToOpenAppKey,
                    false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
