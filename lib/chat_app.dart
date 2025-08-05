import 'package:chat_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';

import 'core/utils/app_colors.dart';
import 'core/utils/app_constants.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.darkBackground,
        fontFamily: AppConstants.appFontFamily,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.darkBackground,
          foregroundColor: AppColors.darkPrimary,
        )
      ),
      routerConfig: AppRouter.router,
    );
  }
}
