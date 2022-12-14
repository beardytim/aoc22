import 'dart:convert';
import '../inputs/day_13.dart';

void main() {
  List<String> input = sampleInput;
  // List<String> input = properInput;
  partA(input);
}

partA(List<String> input) {
  int n = 1;
  for (int i = 0; i <= input.length; i = i + 3) {
    List<dynamic> left = jsonDecode(input[i]);
    List<dynamic> right = jsonDecode(input[i + 1]);
    print("Pair $n - ${comparePairs(left, right)}");
    n++;
  }
  // List<dynamic> left = jsonDecode(input[3]);
  // List<dynamic> right = jsonDecode(input[4]);
  // print("--- pair 2 ---");
  // print(comparePairs(left, right));
}

comparePairs(List<dynamic> leftList, List<dynamic> rightList) {
  // print("COMPARE LISTS ${leftList}-${rightList}");
  if (leftList.isEmpty) {
    return "RIGHTORDER";
  } else if (rightList.isEmpty) {
    return "NOTRIGHTORDER";
  }
  for (int i = 0; i <= leftList.length - 1; i++) {
    if (rightList.length <= i) {
      return "RIGHTORDER";
    }

    // } else if (leftList.length <= i) {
    //   return "NOTRIGHTORDER";
    // }
    var left = leftList[i];
    var right = rightList[i];
    if (left.runtimeType == int && right.runtimeType == int) {
      // left and right are ints below will return
      // print("COMPARE $left - $right");
      String compare = compareNumbers(left, right);
      if (compare == "LEFT") {
        return "RIGHTORDER";
      } else if (compare == "RIGHT") {
        // print("RETURNING COMPARE NOT RIGHT ODERER");
        return "NOTRIGHTORDER";
      }
    } else {
      // print("ONE IS A LIST");
      if (right.runtimeType == int) {
        //right is alist
        // print("RIGHT");
        List<dynamic> rL = [right];
        return comparePairs(left, rL);
      } else if (left.runtimeType == int) {
        //left is a list
        // print("LEFT");
        List<dynamic> lL = [left];
        return comparePairs(lL, right);
      } else {
        //both are lists
        // print("BOTH");
        return comparePairs(left, right);
      }
    }
    // if (leftList.length < rightList.length) {
    //   return "LEFTLISTRANOUT";
    // } else if (leftList.length > rightList.length) {
    //   return "RightLISTRANOUT";
    // }
  }
}

compareNumbers(int left, int right) {
  if (left < right) {
    // print("RETURNING LEFT");
    return "LEFT";
  } else if (right < left) {
    // print("RETURNING RIGHT");
    return "RIGHT";
  } else {
    // print("RETURNING SAME");
    return "SAME";
  }
}

compareList(List<dynamic> leftList, List<dynamic> rightList) {}
