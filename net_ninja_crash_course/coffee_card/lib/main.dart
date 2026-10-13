import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title: Text("Hello World"),
          backgroundColor: Colors.blue[100],
          centerTitle: true,
        ),

        body:const Home()
      ),

    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     color: Colors.orange,
      child: Text("Hello from Mahbub",
      style: TextStyle(
        fontSize: 18,
        letterSpacing: 4,
        decoration: TextDecoration.underline,
        fontStyle: FontStyle.italic
      ),
      ),
      // width: 300,
      // height: 300,
      padding: EdgeInsets.all(20),

    );
  }
}
