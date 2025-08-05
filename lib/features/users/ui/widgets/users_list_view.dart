import 'package:flutter/material.dart';

import 'users_list_view_item.dart';

class UsersListView extends StatelessWidget {
  const UsersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: index == 19 ? 20 : 0),
          child: const UsersListViewItem(),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: 20,
    );
  }
}
