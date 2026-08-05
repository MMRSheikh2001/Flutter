void main(List<String> args) {
  for (var i = 0; i < 11; i++) {
    print(i);
  }

  var numbers = [1, 2, 5];
  for (var n in numbers) {
    print(n + 1);
  }

  numbers.forEach((n) => print(n + 7));

  var num=5;
  while(num==5){
    print("object");
    num++;
  }
}
