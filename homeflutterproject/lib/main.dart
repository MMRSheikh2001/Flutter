import 'package:flutter/material.dart';
import 'package:homeflutterproject/page/app_bar_prac.dart';
import 'package:homeflutterproject/page/container_prac.dart';
import 'package:homeflutterproject/page/counter.dart';
import 'package:homeflutterproject/page/login_page_prac.dart';
import 'package:homeflutterproject/page/rich_text_prac.dart';
import 'package:homeflutterproject/page/scaffold_prac.dart';
import 'package:homeflutterproject/page/tab_bar_implementation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: LoginPagePrac(),
    );
  }
}
