void main(List<String> args) {


  User con = User("Mahbub"," hwefd");
  
  con._name = "gjdfhc";


  con.toStrings();

try{
print(10/0);
}catch(e){
  print(e);
}


}

class User {
  String _email = '';

  String _name = '';

  String _password = '';
  User(String _name, [String _email = "email@gmail.com"]) {}

  void toStrings() {
    print(_email);
    print(_name);
  }
}
