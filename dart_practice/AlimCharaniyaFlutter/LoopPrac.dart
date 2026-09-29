var arr = [
  {"name": "Mahbub", "Age": 25, "Address": "Dhaka"},
  {"name": "Emon", "Age": 30, "Address": "Cumilla"},
  {"name": "Badrul", "Age": 32, "Address": "Barisal"},
  {"name": "Sabbir", "Age": 26, "Address": "Tangail"},
];

void main(List<String> args) {
  for (var a in arr) {
    print(a["name"]);
  }
}
