void main(List<String> args) {
  var x = 100;
  if (x is int) {
    print("Integer");
  }

  if(x%3==0){
    print("by 3");
  }else if(x%4==0){
    print("by 4");
  }

switch(x){
  case 1:
  print("object is 1");
  break;

  default:print(" is 1000fsja");

  List fiveToSeven=[5,6,7];

  List numbers=[1,2,3,4,...fiveToSeven,8,9,10];

  print(numbers);

}

}
