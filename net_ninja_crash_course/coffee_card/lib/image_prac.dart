import 'package:flutter/material.dart';

class ImagePrac extends StatelessWidget {
  const ImagePrac({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Practice"),
        backgroundColor: Colors.grey[100],
      ),

      body: ListView(
        children: [
          Image.asset("assets/Screenshot_13.png", width: 25),
          SizedBox(height: 20),
          Image.asset("assets/Screenshot_16.png", width: 50),
          SizedBox(height: 20),
          Image.asset("assets/Screenshot_17.png", width: 75),
          SizedBox(height: 20),
          Expanded(child: Image.asset("assets/Screenshot_18.png", width: 100,
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),

          )
        ],
      ),
    );
  }
}
