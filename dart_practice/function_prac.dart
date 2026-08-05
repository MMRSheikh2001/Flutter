void main(List<String> args) {
  print(square(12));
  print(sum(12, 45));
}

dynamic square(num n) {
  return n * n;
}

var sum = (int a, int b) => a + b;
