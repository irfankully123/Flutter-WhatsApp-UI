import 'package:flutter/material.dart';
import 'package:whatsapp/screens/CallsTab.dart';
import 'package:whatsapp/screens/ChatTab.dart';
import 'package:whatsapp/screens/StatusTab.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  Widget openPopUp() {
    return PopupMenuButton(
      itemBuilder: (context) {
        return List.generate(
            3,
                (index) => const PopupMenuItem(
              child: Text('Setting'),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        floatingActionButton: Container(
          width: 50,
          height: 50,
          child: FloatingActionButton(
            child: const Icon(Icons.chat),
            onPressed: () {},
          ),
        ),
        appBar: AppBar(
          actions: [
            // Widget for the search
            const Icon(Icons.search),
            // Widget for implementing the three-dot menu
            PopupMenuButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              itemBuilder: (context) {
                return [
                  // In this case, we need 5 popupmenuItems one for each option.
                  const PopupMenuItem(child: Text('New Group')),
                  const PopupMenuItem(child: Text('New Broadcast')),
                  const PopupMenuItem(child: Text('Linked Devices')),
                  const PopupMenuItem(child: Text('Starred Messages')),
                  const PopupMenuItem(child: Text('Settings')),
                ];
              },
            ),
          ],
          backgroundColor: const Color(0xff128C7E),
          title: const Text('WhatsApp'),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                  iconMargin: EdgeInsets.all(100),
                  child: Icon(
                    Icons.camera_alt_rounded,
                  )),
              Tab(
                child: Text('CHATS', style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child: Text('STATUS', style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child: Text('CALLS', style: TextStyle(color: Colors.white)),
              ),
            ],
            labelColor: Colors.white,
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('This feature is coming soon')),
            ChatsTab(),
            StatusTab(),
            CallTab(),
          ],
        ),
      ),
    );
  }
}

