import 'package:flutter/material.dart';

class ScaffoldPrac extends StatelessWidget {
  const ScaffoldPrac({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text(
          "This is Scaffold Practice",
          style: TextStyle(color: Colors.deepOrange),
        ),
      ),
      body: Center(
        child: Text(
          "This is Scaffold practice .I am trying Body Center practice.",
          style: TextStyle(color: Colors.green, fontSize: 40),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        elevation: 10,
        child: Icon(Icons.add, color: Colors.black),
        onPressed: () => {},
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.lime),
              child: Text(
                "This is drawer practice",
                style: TextStyle(color: Colors.amber, fontSize: 30),
              ),
            ),
            ListTile(title: Text("Item 1 "), leading: Icon(Icons.people)),
            ListTile(title: Text("Item 2 "), leading: Icon(Icons.mail)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        fixedColor: Colors.yellow,

        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
