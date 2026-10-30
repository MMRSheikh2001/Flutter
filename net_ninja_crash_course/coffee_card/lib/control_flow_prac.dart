import 'package:coffee_card/custom_widget_prac.dart';
import 'package:flutter/material.dart';

class ControlFlowPrac extends StatefulWidget {
  const ControlFlowPrac({super.key});

  @override
  State<ControlFlowPrac> createState() => _ControlFlowPracState();
}

class _ControlFlowPracState extends State<ControlFlowPrac> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Control Flow Practice"),
        backgroundColor: Colors.grey[100],
      ),
body: ListView(
  children: [
    for(int i=0;i<10;i++)
      StyleBodyText("Hello "+i.toString())
    
  ],
),
    );
  }
}
