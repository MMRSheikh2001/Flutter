


void main(List<String> args) async {
  // greet().then((m) {
  //   print(m);
  // });

  final res = await greet();
  print(res);
}

Future<String> greet() {
  const delay = Duration(seconds: 5);

  return Future.delayed(delay, () {
    return "Hello World";
  });
}
