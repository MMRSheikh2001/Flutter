void main(List<String> args) {
  int integer = int.parse("1");
  assert(integer == 1);

  String a = 12.toString();
  if (a == "12") {
    print("ok");
  }


  String b=3.1416.toStringAsFixed(2);
  print(b);
}
