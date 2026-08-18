import 'package:flutter/material.dart';
import 'package:work_bridge_flutter/auth/screen/login_screen.dart';
import 'package:work_bridge_flutter/public_pages/home_page.dart';
import 'package:work_bridge_flutter/themes/app_theme.dart';

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
      title: 'WorkBridge',
      theme: AppTheme.light_,
      home: LoginScreen(),
    );
  }
}
