import 'package:coffee_card/custom_widget_prac.dart';
import 'package:flutter/material.dart';

class ButtonPrac extends StatefulWidget {
  const ButtonPrac({super.key});

  @override
  State<ButtonPrac> createState() => _ButtonPracState();
}

class _ButtonPracState extends State<ButtonPrac> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Button Practice"),
        backgroundColor: Colors.grey[100],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          StyleBodyText(
            "Count : $_count",

          ),

          const SizedBox(height: 50),
          FilledButton(
            onPressed: () {
              setState(() {
                _count++;
              });
            },
            child: const StyleBodyText("+"),
          ),
          const SizedBox(height: 20),
          TextButton(style: TextButton.styleFrom(
            foregroundColor: Colors.blue,
            textStyle: const TextStyle(fontSize: 20),
          ),
            onPressed: () {
              setState(() {
                _count--;
                if(_count<0){
                  _count=0;
                }
              });
            },
            child: const StyleBodyText("-"),
          ),
        ],
      ),
    );
  }
}
