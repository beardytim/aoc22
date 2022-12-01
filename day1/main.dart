import 'data.dart';

void main() {
  List<String> input = properInput;

  int x = 0;
  List<int> calc = [];
  for (int n = 0; n < input.length; n++) {
    if (input[n] != "") {
      x += int.parse(input[n]);
    } else {
      calc.add(x);
      x = 0;
    }
  }
  calc.add(x);
  calc.sort();
  print("Max = ${calc[calc.length - 1]}");
  print(
      "Sum of top three = ${calc[calc.length - 1] + calc[calc.length - 2] + calc[calc.length - 3]}");
}
