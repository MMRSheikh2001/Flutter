void main(List<String> args) {
  String name = "Mahbub";

  int age = 25;

  bool isAdult = true;

  double salary = 25.05;

  print(
    "Hello i am ${name}.I am ${age} years old. Me being an adult is ${isAdult}.My Salary is ${salary}",
  );

  print("Sabbir is ${greet(name: "Sabbir",age: 27)} years old");
}

int greet({String? name,required int age }) {
  return age;
}
