import '../inputs/day_7.dart';

void main() {
  // List<String> input = sampleInput;
  List<String> input = properInput;

  print("Part A: ${partA(input)}");
  print("Part B: ${partB(input)}");
}

partA(List<String> input) {
  List<Item> baseDir = buildSystem(input);
  int dirSize = 0;
  baseDir
      .where((dir) => dir.size! <= 100000)
      .forEach((element) => dirSize += element.size!);
  return dirSize;
}

partB(List<String> input) {
  List<Item> baseDir = buildSystem(input);
  int baseSize = 70000000 - baseDir[0].size!;
  int sizeNeeded = 30000000 - baseSize;
  int dirSize = 30000000;
  baseDir.where((dir) => dir.size! >= sizeNeeded).forEach((element) {
    if (element.size! < dirSize) {
      dirSize = element.size!;
    }
  });
  return dirSize;
}

buildSystem(List<String> input) {
  List<Item> baseDir = [];
  Item root = Item.dir("/", null);
  Item currentDir = root;

  for (String line in input) {
    List<String> command = line.split(" ");
    if (command[0] == "\$") {
      if (command[1] == "cd") {
        if (command[2] == "..") {
          currentDir = currentDir.parent!;
        } else {
          //create dir here
          Item previousDir = currentDir;
          String dirName = '${currentDir.name}/${command[2]}'
              .replaceAll("///", "/")
              .replaceAll("//", "/");
          currentDir = Item.dir(dirName, previousDir);
          // Item.dir('${command[2]}', previousDir);
          previousDir.children.add(currentDir);
          baseDir.add(currentDir);
        }
      } // else ls but not needed...?
    } else {
      if (command[0] == "dir") {
        //skip as creating dir upthere
      } else {
        currentDir.children.add(Item.file(command[1], int.parse(command[0])));
      }
    }
  }

  //must be a better way
  baseDir.forEach((dir) {
    calculateSize(dir);
  });

  return baseDir;
}

int calculateSize(Item dir) {
  int temp = 0;
  dir.children.forEach((item) {
    if (item.children.isEmpty) {
      temp += item.size!;
    } else {
      temp += calculateSize(item);
    }
  });
  dir.size = temp;
  return temp;
}

class Item {
  String name;
  List<Item> children = [];
  Item? parent;
  int? size;

  Item.dir(this.name, this.parent) : size = 0;
  Item.file(this.name, this.size) : parent = null;
}
