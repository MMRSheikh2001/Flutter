import 'package:coffee_card/button_prac.dart';
import 'package:coffee_card/column_prac.dart';
import 'package:coffee_card/home.dart';
import 'package:coffee_card/image_prac.dart';
import 'package:coffee_card/row_prac.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
        home: ButtonPrac());
  }
}

//
// class Home extends StatelessWidget {
//   const Home({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Hello World"),
//         backgroundColor: Colors.blue[100],
//         centerTitle: true,
//       ),
//     );
//   }
// }
