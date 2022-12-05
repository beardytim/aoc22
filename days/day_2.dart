import '../inputs/day_2.dart';

void main() {
  List<String> input = properInput;

  int score = 0;
  for (int i = 0; i < input.length; i++) {
    score += roundScore(input[i]);
  }
  print("Score: $score");
}

int roundScore(String game) {
  List<String> moves = game.split(" ");
  String elfMove = moves[0];
  String myMove = convertMove(moves[1], elfMove);
  int score = outcomeScore(myMove, elfMove);
  score += handScore(myMove);
  return score;
}

String convertMove(String move, String elfMove) {
  switch (move) {
    case "X": // lose
      switch (elfMove) {
        case "A":
          return "C";
        case "B":
          return "A";
        case "C":
          return "B";
      }
      break;
    case "Y": // draw
      return elfMove;
    case "Z": // win
      switch (elfMove) {
        case "A":
          return "B";
        case "B":
          return "C";
        case "C":
          return "A";
      }
      break;
  }
  return "";
}

int handScore(String move) {
  switch (move) {
    case "A":
      return 1;
    case "B":
      return 2;
    case "C":
      return 3;
  }
  return 0;
}

int outcomeScore(String myMove, String elfMove) {
  if (myMove == elfMove) {
    return 3;
  } else if (myMove == "A" && elfMove == "C") {
    return 6;
  } else if (myMove == "C" && elfMove == "B") {
    return 6;
  } else if (myMove == "B" && elfMove == "A") {
    return 6;
  } else {
    return 0;
  }
}
