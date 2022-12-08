import '../inputs/day_8.dart';

void main() {
  // List<String> input = sampleInput;
  List<String> input = properInput;
  print("Part A: ${partA(input)}");
  print("Part B: ${partB(input)}");
}

partB(List<String> input) {
  //
  //
  // THIS IS PANTS! COULD BE LOADS BETTER....
  //
  //
  int maxScore = 0;
  List<List<int>> grid = buildGrid(input);
  // for (List<int> line in grid) {
  //   print(line);
  // }
  for (int i = 1; i <= grid.length - 2; i++) {
    for (int l = 1; l <= grid[i].length - 2; l++) {
      int tree = grid[i][l];
      // up
      int viewUp = 0;
      for (int x = 1; x <= i; x++) {
        if (grid[i - x][l] < tree) {
          viewUp++;
        } else {
          viewUp++;
          break;
        }
      }
      // down
      int viewDown = 0;
      for (int x = 1; x <= grid.length - 1 - i; x++) {
        if (grid[i + x][l] < tree) {
          viewDown++;
        } else {
          viewDown++;
          break;
        }
      }
      // left
      int viewLeft = 0;
      for (int x = 1; x <= l; x++) {
        if (grid[i][l - x] < tree) {
          viewLeft++;
        } else {
          viewLeft++;
          break;
        }
      }
      // right
      int viewRight = 0;
      for (int x = 1; x <= grid[i].length - 1 - l; x++) {
        if (grid[i][l + x] < tree) {
          viewRight++;
        } else {
          viewRight++;
          break;
        }
      }

      int score = viewRight * viewLeft * viewUp * viewDown;
      maxScore < score ? maxScore = score : null;
    }
  }
  return maxScore;
}

partA(List<String> input) {
  List<List<int>> grid = buildGrid(input);
  // for (List<int> line in grid) {
  //   print(line);
  // }
  int gridSizeX = grid[0].length;
  int gridSizeY = grid.length;
  int outsideTrees = ((gridSizeX + gridSizeY) * 2) - 4;
  int insideTrees = 0;

  for (int i = 1; i <= grid.length - 2; i++) {
    for (int l = 1; l <= grid[i].length - 2; l++) {
      int tree = grid[i][l];
      // up
      bool tallUp = false;
      for (int x = 1; x <= i; x++) {
        if (grid[i - x][l] < tree) {
          tallUp = true;
        } else {
          tallUp = false;
          break;
        }
      }
      // down
      bool tallDown = false;
      for (int x = 1; x <= grid.length - 1 - i; x++) {
        if (grid[i + x][l] < tree) {
          tallDown = true;
        } else {
          tallDown = false;
          break;
        }
      }
      // left
      bool tallLeft = false;
      for (int x = 1; x <= l; x++) {
        if (grid[i][l - x] < tree) {
          tallLeft = true;
        } else {
          tallLeft = false;
          break;
        }
      }
      bool tallRight = false;
      for (int x = 1; x <= grid[i].length - 1 - l; x++) {
        if (grid[i][l + x] < tree) {
          tallRight = true;
        } else {
          tallRight = false;
          break;
        }
      }
      if (tallUp || tallDown || tallLeft || tallRight) {
        insideTrees++;
      }
    }
  }
  return insideTrees + outsideTrees;
}

buildGrid(List<String> input) {
  List<List<int>> grid = [];
  for (String line in input) {
    grid.add(line.split("").map(int.parse).toList());
  }
  return grid;
}
