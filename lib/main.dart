import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final questions = [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9}
      ],
    },
    {
      'questionText': 'What\'s your favourite Instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Leo', 'score': 1},
        {'text': 'Nick', 'score': 1},
        {'text': 'Jack', 'score': 1}
      ],
    }
  ];
  int _questionIndex = 0;
  int _totalScore = 0;

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void answerQuestion(int score) {
    setState(() {
      _questionIndex += 1;
    });
    _totalScore += score;
    //print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My Quiz'),
      ),
      body: _questionIndex < questions.length
          ? Quiz(
              answerQuestion: answerQuestion,
              questions: questions,
              questionIndex: _questionIndex)
          : Result(_totalScore, resetQuiz),
    ));
  }
}
