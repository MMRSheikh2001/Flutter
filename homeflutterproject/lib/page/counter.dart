import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("A simple Counter"),
      ),
      body: Center(
        child: Text(
          "$_count",
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
      )
      ,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => {
          setState(() {
            _count++;
          }),
        },
      ),
    );
  }
}
