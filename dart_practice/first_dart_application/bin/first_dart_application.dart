import 'dart:io';

import 'package:first_dart_application/first_dart_application.dart'
    as first_dart_application;

void main(List<String> arguments) {
  print('Hello world: ${first_dart_application.calculate()}!');
  print("Mahbub");
  String first_name = "Mahbub";
  var last_name = "R Rahman";

  print(first_name + " " + last_name + " " + "");

  stdout.writeln("What is your name? : ");
  var name = stdin.readLineSync();
  int age = stdin.readByteSync();
  print("my name is $name   .Age is $age");
}
