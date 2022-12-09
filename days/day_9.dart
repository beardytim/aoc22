import '../inputs/day_9.dart';

void main() {
  List<String> input = sampleInput;
  // List<String> input = properInput;
  partA(input);
}

partA(List<String> input) {
  List<Location> history = [];
  Location h = Location(0, 0);
  Location t = Location(0, 0);
  history.add(Location(t.x, t.y));
  for (String line in input) {
    List<String> steps = line.split(" ");
    String direction = steps[0];
    for (int i = 1; i <= int.parse(steps[1]); i++) {
      if (direction == "R") {
        h.x++;
        if (h.y == t.y) {
          //same line
          if (t.x != h.x - 1) {
            t.x++;
            history.add(Location(t.x, t.y));
          }
        } else {
          //different line
          if (t.x != h.x + 1) {
            t.y = h.y;
            history.add(Location(t.x, t.y));
          }
        }
      } else if (direction == "U") {
        h.y++;
        if (h.x == t.x) {
          //same line
          if (t.y != h.y - 1) {
            t.y++;
            history.add(Location(t.x, t.y));
          }
        } else {
          //different line
          if (t.y != h.y + 1 || t.y != h.y - 1) {
            t.x = h.x;
            history.add(Location(t.x, t.y));
          }
        }
      } else if (direction == "L") {
        h.x--;
        if (h.y == t.y) {
          //same line
          if (t.x != h.x + 1) {
            t.x--;
            history.add(Location(t.x, t.y));
          }
        } else {
          //different line
          if (t.x != h.x - 1) {
            t.y = h.y;
            history.add(Location(t.x, t.y));
          }
        }
      } else if (direction == "D") {
        h.y--;
        if (h.x == t.x) {
          //same line
          if (t.y != h.y + 1) {
            t.y--;
            history.add(Location(t.x, t.y));
          }
        } else {
          //different line
          if (t.y != h.y + 1 || t.y != h.y - 1) {
            t.x = h.x;
            history.add(Location(t.x, t.y));
          }
        }
      }
    }
  }
  print(history.length);
  var map = Map();

  history.forEach((line) {
    if (!map.containsKey(line)) {
      map[line] = 1;
    } else {
      map[line] += 1;
    }
  });
  print(map.length);
}

class Location {
  int x;
  int y;

  Location(this.x, this.y);
}
