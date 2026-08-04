import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.black, child: Text("Hello,shaharan.what are you doing?")),
      ),
      body: const Center(
        child: Text("Body is in Center",
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight(100),
          color: Colors.red
        ),
        ),

      ),

    );
  }
}
