import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/answers.dart';
import 'package:quiz_app/screens/questions_answers_screen.dart';
import '../providers/api_question_answer.dart';

// import 'package:trivia_app/question_pageview.dart';
// import 'package:trivia_app/model/shuffleanswers.dart';

//todo change this name
typedef void Randomise(List options);

class QuestionsAnswers extends StatefulWidget {
  QuestionsAnswers({Key? key}) : super(key: key);
  List wrongRightList = [];

  @override
  _QuestionsAnswersState createState() => _QuestionsAnswersState();
}

class _QuestionsAnswersState extends State<QuestionsAnswers> {
  final ApiQuestionAnswer _apiQuestionAnswer = ApiQuestionAnswer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        //title: const Text('Trivia questions'),
      ),
      body: _futureWidget(),
    );
  }

  _futureWidget() {
    return FutureBuilder(
      future: _apiQuestionAnswer.getStates(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List results = snapshot.data as List;
          Answers(
              result: results,
              shuffler: (options) {
                widget.wrongRightList = options;
              });

          return QuestionsAnswersScreen(
              results: results, wrongRightList: widget.wrongRightList);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
