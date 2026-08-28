import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> jobs = [];

  Future fetchData() async {
    final url = Uri.parse("http://localhost:8090/api/jobs/");
    final response = await http.get(url);

    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("Success");
    } else {
      print("Failure");
    }
    jobs = jsonDecode(response.body);
    print(jobs.toString());

    print(jobs.length);

    print(jobs[1].toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.black, child: Text("Hello world from home")),
      ),

      body: ListView.builder(
        itemCount: jobs.length,
          itemBuilder: (_,index){
          final _job=jobs[index];
            return Card(
              child:  ListTile(
                leading: Image.network("http://localhost:8090/api/files/companyprofiles/"+_job["companyLogo"]),
                title: Text(jobs[index]["title"]),
                subtitle: Text(_job["jobDescription"]),
              ),
            );
          }
      )
    );
  }
}
