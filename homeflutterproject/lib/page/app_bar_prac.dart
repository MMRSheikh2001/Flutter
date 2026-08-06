import 'package:flutter/material.dart';

class AppBarPrac extends StatelessWidget {
  const AppBarPrac({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.red,
        title: Text(
          "This is Appbar Practice",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      body: Center(
        child: Text(
          "This is Appbar Practice.The text is in center of body",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
