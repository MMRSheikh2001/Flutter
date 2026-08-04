void main(List<String> args) {
  /*
String
int
double
bool
dynamic 
var
*/

  String name = "Mahbub";
  int age = 26;
  double money = 200.02;

  bool truth = true;

  dynamic value = truth;
  print(value);
  value = money;
  print(value);
  print(
    "My name is $name .I am $age years old.I have $money taka on me.Everything i said is $truth",
  );
  value = null;
  print(value);

  String text = """
This is a multiple line text.
This is 2nd line.
This is 3rd.
""";
  print(text);
}
