import 'package:flutter/material.dart';
import '../widgets/questions_answers.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var buttonForeGroundColor = Theme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Text(
                  'Quiz Game',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionsAnswers(),
                      ),
                    );
                  },
                  child: Text(
                    'Click to Start',
                    style: Theme.of(context).textTheme.headline4!.merge(
                          TextStyle(
                            color: buttonForeGroundColor,
                          ),
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
