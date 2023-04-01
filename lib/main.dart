import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      // theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green[700]),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabC = TabController(length: 4, vsync: this);

  @override
  Widget build(BuildContext context) {
    int chats = 5;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF075E55),
        child: const Icon(Icons.message),
      ),
      appBar: AppBar(
        // leading: Icon(Icons.more_vert),
        // backgroundColor: Colors.teal,
        actions: [
          Row(
            // mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.camera_alt_outlined),
              SizedBox(width: 20),
              Icon(Icons.search),
              SizedBox(width: 15),
              Icon(Icons.more_vert),
            ],
          )
        ],
        backgroundColor: Color(0xFF075E55),
        title: Text("Whatsapp Botleg"),
        bottom: TabBar(controller: tabC, tabs: [
          Tab(
            child: Icon(Icons.groups),
          ),
          Tab(
            child: Row(
              children: [
                Text(
                  "Chats ",
                ),
                Spacer(),
                Container(
                  alignment: Alignment.center,
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25 / 2)),
                  child: Text(
                    "${chats * 20}",
                    style: TextStyle(fontSize: 8, color: Colors.black),
                  ),
                )
              ],
            ),
          ),
          Tab(
            text: "Status",
          ),
          Tab(
            text: "Calls",
          ),
        ]),
      ),
      body: TabBarView(controller: tabC, children: [
        // GROUPS
        const Center(
          child: Text("Groups"),
        ),
        // CHATS
        ListView.builder(
          itemCount: 20,
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
                        child: Text(
                          "$chats",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xFF0FCE5E),
                            borderRadius: BorderRadius.circular(28 / 2)),
                      ),
                    ],
                  )),
            );
          },
        ),
        // STATUS
        const Center(
          child: Text("Status"),
        ),
        // CALLS
        const Center(
          child: Text("Calls"),
        ),
      ]),
    );
  }
}
 