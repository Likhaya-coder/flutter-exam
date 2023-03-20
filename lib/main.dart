import 'package:flutter/material.dart';
import 'package:flutter_exam/security.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FlutterExam(),
  ));
}

class FlutterExam extends StatefulWidget {
  const FlutterExam({Key? key}) : super(key: key);

  @override
  State<FlutterExam> createState() => _FlutterExamState();
}

class _FlutterExamState extends State<FlutterExam> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool? userPickedAnswer) {
    bool selectedAnswer = securedQuestions.getAnswers();

    setState(() {
      if (selectedAnswer == userPickedAnswer) {
        scoreKeeper.add(
          const Icon(FontAwesomeIcons.check, color: Colors.green),
        );
      } else {
        scoreKeeper.add(
          const Icon(FontAwesomeIcons.xmark, color: Colors.red),
        );
      }
      if (securedQuestions.isExamFinished() == true) {
        Alert(
          context: context,
          title: "Finished",
          desc: "You've reached the end of the quiz.",
          closeIcon: const Icon(null),
          image: Image.asset("images/alert.png"),
          buttons: [
            DialogButton(
                child: const Text('Reset'),
                onPressed: () {
                  Navigator.pop(context);
                },
            ),
          ],
        ).show();
        securedQuestions.reset();
        scoreKeeper = [];
      }
      securedQuestions.nextQuestion();
    });
  }

  Security securedQuestions = Security();

  @override
  Widget build(BuildContext context) {
    /**/

    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text('Test your flutter knowledge'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  securedQuestions.getQuestions(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    minimumSize: const Size.fromHeight(80.0),
                  ),
                  onPressed: () {
                    checkAnswer(true);
                  },
                  child: const Text(
                    'True',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red[700],
                    minimumSize: const Size.fromHeight(80.0),
                  ),
                  onPressed: () {
                    checkAnswer(false);
                  },
                  child: const Text(
                    'False',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: scoreKeeper,
              ),
            ),
            /*const Padding(
              padding: EdgeInsets.only(bottom: 18.0),
              child: Divider(
                color: Colors.white,
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
