import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextView extends StatefulWidget {
  const TextView({super.key});

  @override
  State<TextView> createState() => _TextViewState();
}

class _TextViewState extends State<TextView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Learning From GeeksForGeeks"),
      ),
      body: Center(
        child: Text(
          "Hello to The Geeks!!",
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
