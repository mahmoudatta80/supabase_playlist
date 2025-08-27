import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../../features/auth/logic/create_user_cubit/create_user_cubit.dart';
import '../../features/auth/logic/login_cubit/login_cubit.dart';
import '../../features/auth/logic/register_cubit/register_cubit.dart';
import '../../features/auth/ui/screens/login_screen.dart';
import '../../features/auth/ui/screens/register_screen.dart';
import '../../features/chat_room/ui/chat_room_screen.dart';
import '../../features/layout/ui/layout_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../features/profile/data/repos/profile_repo_impl.dart';
import '../../features/profile/logic/fetch_profile_cubit/fetch_profile_cubit.dart';
import '../utils/app_constants.dart';
import '../utils/app_secure_storage.dart';
import '../utils/app_shared_preferences.dart';
import '../utils/dependency_injection.dart';
import 'app_routes.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.onboardingScreen,
        builder: (context, state) {
          return const OnboardingScreen();
        },
        redirect: (context, state) async {
          final isFirstTimeToOpenApp =
              AppSharedPreferences().getBool(
                AppConstants.isFirstTimeToOpenAppKey,
              ) ??
              true;
          final token = await AppSecureStorage().getData(AppConstants.tokenKey);
          if (isFirstTimeToOpenApp) {
            return AppRoutes.onboardingScreen;
          } else {
            if (token != null) {
              return AppRoutes.layoutScreen;
            } else {
              return AppRoutes.loginScreen;
            }
          }
        },
      ),
      GoRoute(
        path: AppRoutes.registerScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => RegisterCubit(getIt.get<AuthRepoImpl>()),
                ),
                BlocProvider(
                  create: (context) =>
                      CreateUserCubit(getIt.get<AuthRepoImpl>()),
                ),
              ],
              child: const RegisterScreen(),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),
      GoRoute(
        path: AppRoutes.loginScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: BlocProvider(
              create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
              child: const LoginScreen(),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),
      GoRoute(
        path: AppRoutes.layoutScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: BlocProvider(
              create: (context) =>
                  FetchProfileCubit(getIt.get<ProfileRepoImpl>())
                    ..fetchProfile(),
              child: const LayoutScreen(),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),
      GoRoute(
        path: AppRoutes.chatRoomScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const ChatRoomScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),
    ],
  );
}
