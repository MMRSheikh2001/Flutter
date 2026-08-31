void main() async {
  print('Ordering...');
  var greeting = await getGreeting();
  print(greeting);
  print('Done.');
}
Future<String> getGreeting() async {
    await Future.delayed(Duration(seconds: 5));
    return 'Hello';
  }