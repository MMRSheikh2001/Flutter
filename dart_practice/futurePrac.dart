void main(List<String> args) {
  Future<String> getGreeting() async {
    await Future.delayed(Duration(seconds: 5));
    return 'Hello';
  }

  print(getGreeting().toString());
}
