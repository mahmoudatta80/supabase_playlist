import 'package:flutter/material.dart';

import '../../chats/ui/chats_view.dart';
import '../../profile/ui/profile_view.dart';
import '../../users/ui/users_view.dart';
import 'widgets/custom_bottom_navigation_bar.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  List<Widget> screens = [
    const ChatsView(),
    const UsersView(),
    const ProfileView(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screens[_currentIndex]),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
      ),
    );
  }
}
