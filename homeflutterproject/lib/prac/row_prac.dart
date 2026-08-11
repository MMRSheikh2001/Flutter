import 'package:flutter/material.dart';

class RowPrac extends StatelessWidget {
  const RowPrac({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.red
                ),
              ),
              SizedBox(width: 50),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.green
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
