import 'package:flutter/material.dart';
import 'package:whatsapp_ui/widgets/status_page.dart';

import 'calls_page.dart';

import 'groups_page.dart';
import 'home_page.dart';

class TabBarItem extends StatelessWidget {
  const TabBarItem({
    super.key,
    required this.tabC,
    required this.chats,
  });

  final TabController tabC;
  final int chats;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabC,
      children: [
        // GROUPS
        GroupPage(),
        // CHATS
        ChatsPage(chats: chats),
        // STATUS
        StatusPage(),
        // CALLS
        CallsPage(),
      ],
    );
  }
}
