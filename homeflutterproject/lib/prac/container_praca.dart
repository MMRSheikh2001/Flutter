

import 'package:flutter/material.dart';

class BigContainerPrac extends StatelessWidget {
  const BigContainerPrac({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Container(

          height: double.infinity,
          width: 200,
          color: Colors.red,

        ),
      )
    );
  }
}
