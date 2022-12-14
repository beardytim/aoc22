import '../inputs/day_11.dart';

void main() {
  // List<String> input = sampleInput;
  List<String> input = properInput;

  print("Part A: ${partA(input)}");
  print("Part B: ${partB(input)}");

  // for (String line in input) {
  //   print(line);
  // }
}

partB(List<String> input) {
  List<Monkey> monkeys = buildMonkeys(input);
  int dom = 1;
  for (Monkey monkey in monkeys) {
    dom *= monkey.test;
  }
  for (int x = 1; x <= 10000; x++) {
    for (Monkey monkey in monkeys) {
      for (int item = 0; item < monkey.items.length; item++) {
        monkey.inspected++;
        int worry = worryLevel(monkey.items[item] % dom, monkey.operation, 1);
        if (worry % monkey.test == 0) {
          //is True
          monkeys[monkey.ifTrue].items.add(worry);
        } else {
          //is False
          monkeys[monkey.ifFalse].items.add(worry);
        }
      }
      monkey.items = [];
    }
    print("ROUND $x");
    for (Monkey monkey in monkeys) {
      print(
          "Monkey ${monkey.number} inspected items ${monkey.inspected} times.");
    }
  }

  monkeys..sort((a, b) => b.inspected - a.inspected);
  return monkeys[0].inspected * monkeys[1].inspected;
}

partA(List<String> input) {
  List<Monkey> monkeys = buildMonkeys(input);
  for (int x = 1; x <= 20; x++) {
    for (Monkey monkey in monkeys) {
      for (int item = 0; item < monkey.items.length; item++) {
        monkey.inspected++;
        int worry = worryLevel(monkey.items[item], monkey.operation, 3);
        if (worry % monkey.test == 0) {
          //is True
          monkeys[monkey.ifTrue].items.add(worry);
        } else {
          //is False
          monkeys[monkey.ifFalse].items.add(worry);
        }
      }
      monkey.items = [];
    }
    // print("ROUND $x");
    // for (Monkey monkey in monkeys) {
    //   print("${monkey.number} - ${monkey.items} - ${monkey.inspected}");
    // }
  }

  monkeys..sort((a, b) => b.inspected - a.inspected);
  return monkeys[0].inspected * monkeys[1].inspected;
}

int worryLevel(int worry, String operation, int bored) {
  List<String> breakdown = operation.split(" ");
  int x, y;
  if (breakdown[0] == "old") {
    x = worry;
  } else {
    x = int.parse(breakdown[0]);
  }
  if (breakdown[2] == "old") {
    y = worry;
  } else {
    y = int.parse(breakdown[2]);
  }
  if (breakdown[1] == "*") {
    return ((x * y) / bored).floor();
    // return x * y;
  } else {
    return ((x + y) / bored).floor();
    // return x + y;
  }
}

List<Monkey> buildMonkeys(List<String> input) {
  List<Monkey> monkeys = [];
  for (int x = 0; x <= input.length; x = x + 7) {
    int number =
        int.parse(input[x].substring(input[x].length - 2, input[x].length - 1));
    List<int> items = [];
    input[x + 1]
        .substring(18)
        .split(", ")
        .forEach((item) => items.add(int.parse(item)));
    String operation = input[x + 2].substring(19);
    int test = int.parse(input[x + 3].split(" ")[5]);
    int ifTrue = int.parse(input[x + 4].split(" ")[9]);
    int ifFalse = int.parse(input[x + 5].split(" ")[9]);
    monkeys.add(Monkey(number, items, operation, test, ifTrue, ifFalse));
  }
  return monkeys;
}

class Monkey {
  final int number;
  List<int> items;
  final String operation;
  final int test;
  final int ifTrue;
  final int ifFalse;
  int inspected = 0;
  int divisor = 0;

  Monkey(this.number, this.items, this.operation, this.test, this.ifTrue,
      this.ifFalse);
}



// I have no idea why this works. I don't know math that well, but what I did is multiply all of the testing numbers together, calling it "supermodulo", and every time a monkey inspects an item, set the item's value to the item mod the supermodulo, like item = item % supermodulo.