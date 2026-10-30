import 'package:coffee_card/button_prac.dart';
import 'package:coffee_card/control_flow_prac.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ButtonPrac(),
    );
  }
}
