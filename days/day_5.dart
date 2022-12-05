import '../inputs/day_5.dart';

List<List<String>> stacks = [
  ["T", "V", "J", "W", "N", "R", "M", "S"],
  ["V", "C", "P", "Q", "J", "D", "W", "B"],
  ["P", "R", "D", "H", "F", "J", "B"],
  ["D", "N", "M", "B", "P", "R", "F"],
  ["B", "T", "P", "R", "V", "H"],
  ["T", "P", "B", "C"],
  ["L", "P", "R", "J", "B"],
  ["W", "B", "Z", "T", "L", "S", "C", "N"],
  ["G", "S", "L"],
];

List<List<String>> sampleStacks = [
  ["N", "Z"],
  ["D", "C", "M"],
  ["P"],
];

void main() {
  List<String> input = properInput;
  for (String step in input) {
    List<String> sB = step.split(" ");
    int move = int.parse(sB[1]);
    int from = int.parse(sB[3]);
    int to = int.parse(sB[5]);

    List<String> items = [];
    items = stacks[from - 1].sublist(0, move);
    stacks[to - 1].insertAll(0, items);
    stacks[from - 1].removeRange(0, move);

    // PART A
    // for (int i = 1; i <= move; i++) {
    //   item = sampleStacks[from - 1][0];
    //   sampleStacks[to - 1].insert(0, item);
    //   sampleStacks[from - 1].removeAt(0);
    // }
  }

  String ans = "";
  stacks.forEach((stack) => ans += stack[0]);
  print(ans);
}
