import 'package:flutter/material.dart';

class ContainerPrac extends StatelessWidget {
  const ContainerPrac({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Container Practice", style: TextStyle(color: Colors.red)),
      ),
      body: Container(
        height: 300,
        width: double.infinity,

        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,

        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 3),
          
        ),
        transform: Matrix4.rotationZ(0.1),
        child: Text(
          "I am Inside a container during practice",
          style: TextStyle(color: Colors.purple),
        ),
      ),
    );
  }
}
