import '../inputs/day_9.dart';

void main() {
  List<String> input = sampleInput;
  // List<String> input = properInput;
  print("Part A: ${partA(input)}");
}

partA(List<String> input) {
  List<Location> history = [];
  Location h = Location(0, 0);
  Location t = Location(0, 0);
  history.add(t);
  for (String line in input) {
    List<String> steps = line.split(" ");
    String direction = steps[0];
    for (int i = 0; i < int.parse(steps[1]); i++) {
      //try switch instead - less nested
      // move head
      switch (direction) {
        case "R":
          h = Location(h.x + 1, h.y);
          break;
        case "U":
          h = Location(h.x, h.y + 1);
          break;
        case "L":
          h = Location(h.x - 1, h.y);
          break;
        case "D":
          h = Location(h.x, h.y - 1);
          break;
      }

      //if not touching then move tail
      if (!h.touching(t)) {
        switch (direction) {
          case "R":
            t = Location(h.x - 1, h.y);
            break;
          case "U":
            t = Location(h.x, h.y - 1);
            break;
          case "L":
            t = Location(h.x + 1, h.y);
            break;
          case "D":
            t = Location(h.x, h.y + 1);
            break;
        }
      }
      history.add(t);
    }
  }
  //Probably should of just done it as a set in the first place... avoid duplicates.
  //return set.length;
  return history.toSet().length;
}

class Location {
  final int x;
  final int y;

  Location(this.x, this.y);

  bool touching(Location other) {
    return this == other ||
        (x == other.x && (y == other.y + 1 || y == other.y - 1)) ||
        (y == other.y && (x == other.x + 1 || x == other.x - 1)) ||
        (x == other.x + 1 && y == other.y + 1) ||
        (x == other.x - 1 && y == other.y - 1) ||
        (x == other.x + 1 && y == other.y - 1) ||
        (x == other.x - 1 && y == other.y + 1);
  }
}
