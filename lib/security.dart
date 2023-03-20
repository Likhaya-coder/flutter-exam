import 'package:flutter_exam/questions.dart';

class Security {
  int _questionNumber = 0;
  final List<Questions> _examQuestions = [
    Questions(
        questionText: 'Flutter is open source framework', questionAnswer: true),
    Questions(
        questionText: 'Flutter is developed by android', questionAnswer: false),
    Questions(
        questionText:
        'The first version of flutter was known as Sky and ran on the Android OS only',
        questionAnswer: true),
    Questions(
        questionText: 'Flutter 1.0 was released on 4th December 2018',
        questionAnswer: true),
    Questions(
        questionText: 'It\'s difficult to debug flutter',
        questionAnswer: false),
    Questions(
        questionText: 'Flutter does not support screen adaptability',
        questionAnswer: false),
    Questions(
        questionText: 'Flutter tooling is not good as other platform',
        questionAnswer: true),
    Questions(
        questionText: 'Flutter development is slower and harder than traditional methods.',
        questionAnswer: false),
    Questions(
        questionText: 'One of the disadvantages of flutter is the bigger app size',
        questionAnswer: true),
    Questions(
        questionText: 'Flutter\'s "hot reload" feature lets you quickly and easily make changes to your app',
        questionAnswer: true),
  ];

  void nextQuestion() {
    if (_questionNumber < _examQuestions.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestions() {
    return _examQuestions[_questionNumber].questionText;
  }

  bool getAnswers() {
    return _examQuestions[_questionNumber].questionAnswer;
  }

  bool isExamFinished() {
    if (_questionNumber >= _examQuestions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = -1;
  }
}