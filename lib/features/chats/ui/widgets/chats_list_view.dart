import 'package:flutter/material.dart';

import 'chats_list_view_item.dart';

class ChatsListView extends StatelessWidget {
  const ChatsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: index == 19 ? 20 : 0),
          child: const ChatsListViewItem(),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: 20,
    );
  }
}
