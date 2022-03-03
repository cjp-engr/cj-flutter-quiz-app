import '../widgets/questions_answers.dart';

class Answers {
  final List result;
  final Randomise shuffler;
  final List wrongRightList = [];

  Answers({required this.result, required this.shuffler}) {
    wrongRightList.addAll(result.map((e) => []));
    for (int i = 0; i < result.length; i++) {
      List wrong = result.elementAt(i).incorrect_answers;
      List right = [result.elementAt(i).correct_answer];
      wrongRightList[i] = wrong + right;
      wrongRightList[i].shuffle();
    }
    shuffler(wrongRightList);
  }
}
