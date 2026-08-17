

import 'dart:convert';
import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BigContainerPrac extends StatelessWidget {
  List<dynamic> user=[];

   BigContainerPrac({super.key,required this.user});



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Container(

          height: double.infinity,
          width: 200,
          color: Colors.red,

        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: fetchRandomUsers),
    );
  }
  void fetchRandomUsers() async{
   final response=await   http.get(Uri.parse("https://randomuser.me/api/?results=5000"));

   final body=response.body;

   final json=jsonDecode(body);




  }


}
