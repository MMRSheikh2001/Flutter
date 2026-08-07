import 'package:flutter/material.dart';

class TabBarImplementation extends StatelessWidget {
  const TabBarImplementation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(tabs: [
          Tab(icon: Icon(Icons.mail),),
          Tab(icon: Icon(Icons.music_note),),
          Tab(icon: Icon(Icons.person),),
          Tab(icon: Icon(Icons.camera),)
          
          
        ]),
      ),

      
      
    );
  }
}
