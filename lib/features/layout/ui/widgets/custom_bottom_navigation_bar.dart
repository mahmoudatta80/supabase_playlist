import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function(int)? onTap;
  final int currentIndex;
  const CustomBottomNavigationBar({
    super.key,
    this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      backgroundColor: AppColors.darkSecondary,
      selectedItemColor: AppColors.darkPrimary,
      unselectedItemColor: AppColors.darkOnSecondary,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedIconTheme: const IconThemeData(size: 28),
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.chat_rounded), label: "Chats"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "Users"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
