import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui/widgets/tab_bar_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int generateRandom(int number) {
  Random random = Random();
  return random.nextInt(number) + 1;
}

final int chats = generateRandom(10);
const int chatItem = 30;

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabC = TabController(length: 4, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF075E55),
        child: const Icon(Icons.message),
      ),
      appBar: AppBar(
        actions: [
          Row(
            children: const [
              Icon(Icons.camera_alt_outlined),
              SizedBox(width: 20),
              Icon(Icons.search),
              SizedBox(width: 15),
              Icon(Icons.more_vert),
            ],
          )
        ],
        backgroundColor: const Color(0xFF075E55),
        title: const Text("Whatsapp Botleg"),
        // TabBar
        bottom: TabBar(
          controller: tabC,
          tabs: [
            const Tab(
              child: Icon(Icons.groups),
            ),
            Tab(
              child: Row(
                children: [
                  const Text(
                    "Chats ",
                  ),
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25 / 2)),
                    child: Text(
                      "${chats + chatItem}",
                      style: const TextStyle(fontSize: 8, color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
            const Tab(
              text: "Status",
            ),
            const Tab(
              text: "Calls",
            ),
          ],
        ),
      ),
      body: TabBarItem(tabC: tabC, chats: chats),
    );
  }
}

class ChatsPage extends StatelessWidget {
  var chats;

  ChatsPage({
    super.key,
    required this.chats,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatItem,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://picsum.photos/id/${index + 50}/200/300"),
              ),
              title: Text(faker.person.name()),
              subtitle: Text(
                faker.lorem.sentence(),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    faker.date.time(),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                        color: const Color(0xFF0FCE5E),
                        borderRadius: BorderRadius.circular(28 / 2)),
                    child: Text(
                      generateRandom(10).toString(),
                      // "$chats",
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
