import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import '../widgets/questions_answers.dart';

class ScoreScreen extends StatefulWidget {
  final List useranswerlist;
  final List correctanswerlist;
  const ScoreScreen(
      {Key? key, required this.useranswerlist, required this.correctanswerlist})
      : super(key: key);

  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  int count = 0;
  int total = 0;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.correctanswerlist.length; i++) {
      if (widget.correctanswerlist.elementAt(i) ==
          widget.useranswerlist.elementAt(i)) {
        count++;
      }
    }
    count *= 10;
    total = widget.correctanswerlist.length * 10;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final TextStyle body = Theme.of(context).textTheme.bodyText1!;

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text('Trivia Result'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(48),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueGrey[800],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withAlpha(60),
                      blurRadius: 6.0,
                      spreadRadius: 4.0,
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      "Score",
                      //style: GoogleFonts.lato(textStyle: body, fontSize: 30),
                    ),
                  ),
                  Center(
                    child: Text(
                      '$count / $total',
                      //style: GoogleFonts.lato(textStyle: body, fontSize: 28),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            SizedBox(
              width: 200,
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    primary: Colors.blueGrey[800],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionsAnswers(),
                      ),
                    );
                  },
                  child: const Text(
                    'Retake Test',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ));
  }
}
