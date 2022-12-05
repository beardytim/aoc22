import '../inputs/day_4.dart';

void main() {
  List<String> input = properInput;

  int count = 0;
  for (String pairs in input) {
    List<String> leftElf = pairs.split(",")[0].split("-");
    List<String> rightElf = pairs.split(",")[1].split("-");
    if ((int.parse(leftElf[0]) <= int.parse(rightElf[0])) &&
            (int.parse(leftElf[1]) >= int.parse(rightElf[0])) ||
        (int.parse(rightElf[0]) <= int.parse(leftElf[0])) &&
            (int.parse(rightElf[1]) >= int.parse(leftElf[0]))) {
      count++;
    }
  }

  print(count);
}
