import 'package:flutter/material.dart';

class RowPrac extends StatelessWidget {
  const RowPrac({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Row Practice",
          style: TextStyle(fontSize: 30, color: Colors.green),
        ),
        backgroundColor: Colors.grey[100],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 400,
                    width: 100,
                    color: Colors.red,
                    child: Text("3rd container"),
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    height: 500,
                    width: 200,
                    color: Colors.green,
                    child: Text("2nd container"),
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    height: 600,
                    width: 300,
                    color: Colors.purple,
                    child: Text("1st container"),
                    padding: EdgeInsets.all(20),
                  ),
                ],
              ),
              SizedBox(width: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 400,
                    width: 100,
                    color: Colors.red,
                    child: Text("1st container"),
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    height: 500,
                    width: 200,
                    color: Colors.green,
                    child: Text("2nd container"),
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    height: 600,
                    width: 300,
                    color: Colors.purple,
                    child: Text("3rd container"),
                    padding: EdgeInsets.all(20),
                  ),
                ],
              ),
              SizedBox(width: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 400,
                    width: 100,
                    color: Colors.red,
                    child: Text("1st container"),
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    height: 500,
                    width: 200,
                    color: Colors.green,
                    child: Text("3rd container"),
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    height: 600,
                    width: 300,
                    color: Colors.purple,
                    child: Text("2nd container"),
                    padding: EdgeInsets.all(20),
                  ),
                ],
              ),
              SizedBox(width: 20),
            ],
          ),
        ],
      ),
    );
  }
}
