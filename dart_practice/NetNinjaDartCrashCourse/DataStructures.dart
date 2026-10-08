void main(List<String> args) {
  List<int> scores = [12, 45, 3, 44, 65, 34, 67];

  print(scores[3]);

  scores.add(100);

  print(scores[scores.length - 1]);

  scores.remove(3);
  scores.removeLast();
  print(scores);

  scores.shuffle();

  print(scores.indexOf(44));

  Set<String> names = {"Mahbub", "Sabbir", "Badrul", "emon"};
  print(names);
}
