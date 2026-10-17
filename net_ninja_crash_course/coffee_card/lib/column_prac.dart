import 'package:flutter/material.dart';

class ColumnPrac extends StatelessWidget {
  const ColumnPrac({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column Practice",
        style: TextStyle(
          fontSize: 30,
          color: Colors.green
        ),
        ),
        backgroundColor: Colors.grey[100],
      ),
      body: ListView(

        children: [
          Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.red,
                child: Text("0Th container"),
                padding: EdgeInsets.all(20),
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.blue,
                child: Text("1st Container"),
                padding: EdgeInsets.all(20),
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.green,
                child: Text("2nd Container"),
                padding: EdgeInsets.all(20),
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.purple,
                child: Text("3rd Container"),
                padding: EdgeInsets.all(20),
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.orange,
                child: Text("4th Container"),
                padding: EdgeInsets.all(20),
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.yellow,
                child: Text("5th Container"),
                padding: EdgeInsets.all(20),
              ),  Container(
                height: 100,
                width: 100,
                color: Colors.lightBlueAccent,
                child: Text("6th Container"),
                padding: EdgeInsets.all(20),
              )

            ],
          ),
        ],
      )
    );
  }
}
