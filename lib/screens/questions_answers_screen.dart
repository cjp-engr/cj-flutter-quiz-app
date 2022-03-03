import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screens/score_screen.dart';
//import 'package:google_fonts/google_fonts.dart';
import '../widgets/options.dart';
//import 'package:trivia_app/scorepage.dart';

typedef OptionSelectedCallback = void Function(String option);

class QuestionsAnswersScreen extends StatefulWidget {
  final List results;
  final List wrongRightList;

  const QuestionsAnswersScreen(
      {Key? key, required this.results, required this.wrongRightList})
      : super(key: key);

  @override
  _QuestionsAnswersScreenState createState() => _QuestionsAnswersScreenState();
}

class _QuestionsAnswersScreenState extends State<QuestionsAnswersScreen> {
  final List<String> _userAnswerList = [];
  List<String> correctanswerlist = [];
  int currentPagePosition = 0;
  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    _userAnswerList.addAll(widget.results.map((e) => ""));
    correctanswerlist = [];
    for (int i = 0; i < widget.results.length; i++) {
      correctanswerlist.add(widget.results.elementAt(i).correct_answer);
    }

    // for(int i =0; i < widget.results.length; i++) {
    //   _userAnswerList.add("");
    // }
  }

  @override
  Widget build(BuildContext context) {
    //final TextStyle subtitle = Theme.of(context).textTheme.subtitle1!;
    //final TextStyle body = Theme.of(context).textTheme.bodyText1!;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Center(
              child: PageView.builder(
                controller: _controller,
                itemCount: widget.results.length,
                pageSnapping: true,
                onPageChanged: (position) {
                  currentPagePosition = position;
                },
                itemBuilder: (context, index) {
                  String userAnswer = _userAnswerList[index];
                  int checkedOptionPosition =
                      widget.wrongRightList[index].indexOf(userAnswer);

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Question ${index + 1}',
                          // style: GoogleFonts.oswald(
                          //     textStyle: subtitle, color: Colors.yellow[800]),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          '${widget.results.elementAt(index).question}',
                          //   style:
                          //       GoogleFonts.lato(textStyle: body, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Options(
                          index: index,
                          wrongRightList: widget.wrongRightList,
                          selectedPosition: checkedOptionPosition,
                          onOptionsSelected: (selectedOption) {
                            _userAnswerList[currentPagePosition] =
                                selectedOption;
                          },
                        ),
                        const SizedBox(
                          height: 60,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20),
                        ),
                        onPressed: () {
                          _controller.animateToPage(
                            currentPagePosition == 0
                                ? 0
                                : currentPagePosition - 1,
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Text(
                          'Previous',
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          primary: Colors.yellow[800],
                        ),
                        onPressed: () {
                          _controller.animateToPage(
                              currentPagePosition == widget.results.length - 1
                                  ? currentPagePosition
                                  : currentPagePosition + 1,
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.easeIn);
                        },
                        child: const Text(
                          'Next',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        primary: Colors.blueGrey[800],
                        fixedSize:
                            Size(MediaQuery.of(context).size.width * 0.7, 50)),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScoreScreen(
                              useranswerlist: _userAnswerList,
                              correctanswerlist: correctanswerlist,
                            ),
                          ),
                          (route) => false);
                    },
                    child: const Text(
                      'SUBMIT',
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
