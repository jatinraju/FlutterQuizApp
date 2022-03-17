import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText;
    if (resultScore == 0) {
      resultText = 'Try to Answer atleast one Question...';
    } else if (resultScore <= 8) {
      resultText = 'You are Awesome and innocent';
    } else if (resultScore <= 12) {
      resultText = 'Pretty Likeable!';
    } else if (resultScore <= 16) {
      resultText = 'You are .... strange?!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetHandler,
            child: Text(
              'Restart Quiz!',
              style: TextStyle(fontSize: 20),
            ),
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
