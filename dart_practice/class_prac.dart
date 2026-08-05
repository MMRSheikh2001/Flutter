
//Null practice

class Num {
  int a = 10;
  var b=null;
}

void main(List<String> args) {
  var n = Num();
  var number;
  if (n != null) {
    number = n.a;
  }
  print(number);

  number=n ?.b??0;
  print(number);



}
