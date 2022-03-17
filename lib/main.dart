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

  void questionNext() {
    setState(() {
      if (_questionIndex >= questions.length) {
        _questionIndex = questions.length;
      } else {
        _questionIndex += 1;
      }
      print(_questionIndex);
    });
  }

  void questionPrevious() {
    setState(() {
      if (_questionIndex <= 0) {
        _questionIndex = 0;
      } else {
        _questionIndex -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Raleway'),
      home: Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text('My Quiz'),
        )),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 100),
          child: Column(
            children: <Widget>[
              _questionIndex < questions.length
                  ? Quiz(
                      answerQuestion: answerQuestion,
                      questions: questions,
                      questionIndex: _questionIndex,
                    )
                  : Result(_totalScore, resetQuiz),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              left: 30,
              bottom: 20,
              child: FloatingActionButton(
                heroTag: 'back',
                onPressed: questionPrevious,
                child: const Icon(
                  Icons.arrow_left,
                  size: 40,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 30,
              child: FloatingActionButton(
                heroTag: 'next',
                onPressed: questionNext,
                child: const Icon(
                  Icons.arrow_right,
                  size: 40,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
