void main(List<String> args) {
  var pizza = new MenuItem("Pizza", 60.0);

  print(pizza.format());

  var mizzerela = new Pizza(["Cheeze", "Pineapple"], "Pizza", 360.50);

  print(mizzerela.toString());

  print(mizzerela.toppings);
  print(mizzerela.format());

  print("==================");
  print(mizzerela.toString());
  print("==================");

  var collection = new Collection("Foods", [mizzerela]);

  print(collection.randomItem());
  print("==================");

  print("==================");

  print("==================");
}

class MenuItem {
  String? title;

  double? price;

  MenuItem(this.title, this.price);

  String format() {
    return "$title --------> $price";
  }

  @override
  String toString() {
    return format();
  }
}

class Pizza extends MenuItem {
  List<String> toppings = [];

  Pizza(this.toppings, super.title, super.price);

  @override
  String format() {
    return "$title -----------> $price \n$toppings";
  }
}

class Collection<T> {
  String name;
  List<T> data;

  Collection(this.name, this.data);

 T randomItem() {
    data.shuffle();

    return data[0];
  }
}
