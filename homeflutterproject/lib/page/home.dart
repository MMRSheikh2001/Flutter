import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.black, child: Text("Hello world from home")),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.red),
            child: Text("This is Red Color Text"),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text("This is Blue Color Text"),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.green),
            child: Text("This is Green Color Text"),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.yellow),
            child: Text("This is Yellow Color Text"),
          ),
        ],
      ),
    );
  }
}
