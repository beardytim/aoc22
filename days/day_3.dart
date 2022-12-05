import '../inputs/day_3.dart';

void main() {
  List<String> input = properInput;
  List<String> items = [];
  for (int i = 0; i < input.length; i += 3) {
    for (int x = 0; x < input[i].length; x++) {
      String letter =
          checkString(input[i][x], input[i], input[i + 1], input[i + 2]);
      if (letter != "") {
        items.add(letter);
        break;
      }
    }
  }
  int ans = 0;
  items.forEach((item) => ans += checkValue(item)!);
  print(ans);
}

String checkString(String letter, String item1, String item2, String item3) {
  if (item1.contains(letter)) {
    if (item2.contains(letter)) {
      if (item3.contains(letter)) {
        return letter;
      }
    }
  }
  return "";
}

int? checkValue(String letter) {
  Map<String, int> values = {
    "a": 1,
    "b": 2,
    "c": 3,
    "d": 4,
    "e": 5,
    "f": 6,
    "g": 7,
    "h": 8,
    "i": 9,
    "j": 10,
    "k": 11,
    "l": 12,
    "m": 13,
    "n": 14,
    "o": 15,
    "p": 16,
    "q": 17,
    "r": 18,
    "s": 19,
    "t": 20,
    "u": 21,
    "v": 22,
    "w": 23,
    "x": 24,
    "y": 25,
    "z": 26,
  };
  return letter.toUpperCase() == letter
      ? (values[letter.toLowerCase()]! + 26)
      : values[letter];
}
