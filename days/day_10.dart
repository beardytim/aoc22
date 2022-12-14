import '../inputs/day_10.dart';

void main() {
  // List<String> input = sampleInput;
  List<String> input = properInput;

  print("Part A: ${partA(input, [20, 60, 100, 140, 180, 220])}");

  print("Part B:");
  List<String> output = partB(input);
  for (String l in output) {
    print("$l");
  }
}

partB(List<String> input) {
  int x = 1;
  int tick = 0;
  int y = 0; //go through input list

  String line = "";
  List<String> monitor = [];

  void cycle() {
    tick++;
    final y = (tick - 1) % 40;
    if (x >= y - 1 && x <= y + 1) {
      line += "█";
    } else {
      line += " ";
    }
    if (y == 39) {
      monitor.add(line);
      line = "";
    }
  }

  while (true) {
    if (y == input.length) {
      break;
    }
    List<String> inputs = input[y].split(" ");
    if (inputs[0] == "noop") {
      cycle();
    } else {
      cycle();
      cycle();

      x += int.parse(inputs[1]);
    }
    y++;
  }

  return monitor;
}

partA(List<String> input, List<int> signals) {
  int x = 1;
  int tick = 0;
  int y = 0; //go through input list
  List<Cycle> cycles = [];
  int sum = 0;

  void cycle() {
    cycles.add(Cycle(tick, x));
    tick++;
    if (signals.contains(tick)) {
      sum += tick * x;
    }
  }

  while (true) {
    if (y == input.length) {
      break;
    }
    List<String> inputs = input[y].split(" ");
    if (inputs[0] == "noop") {
      cycle();
    } else {
      cycle();
      cycle();

      x += int.parse(inputs[1]);
    }
    y++;
  }

  return sum;
}

class Cycle {
  final int tick;
  final int x;
  Cycle(this.tick, this.x);
}
