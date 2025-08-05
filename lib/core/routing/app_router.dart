import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/chat_room/ui/chat_room_screen.dart';
import '../../features/layout/ui/layout_screen.dart';
import 'app_routes.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.layoutScreen,
        builder: (context, state) {
          return const LayoutScreen();
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
