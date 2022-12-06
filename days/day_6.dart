import '../inputs/day_6.dart';

void main() {
  // List<String> input = sampleInput;
  List<String> input = properInput;

  int bufferSize = 14;

  Iterable<String> letters = [];
  for (int i = 0; i < input[0].length; i++) {
    if (letters.toSet().length == bufferSize) {
      print(i);
      break;
    }
    letters = [input[0][i], ...letters].take(bufferSize);
  }
}
