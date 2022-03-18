import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  var loadImage;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText;
    if (resultScore == 0) {
      resultText = 'Try to Answer atleast one Question...';
      loadImage = 'assets/images/thinking.png';
    } else if (resultScore <= 8) {
      resultText = 'You are Awesome and innocent';
      loadImage = 'assets/images/angel.png';
    } else if (resultScore <= 12) {
      resultText = 'Pretty Likeable!';
      loadImage = 'assets/images/smile.png';
    } else if (resultScore <= 16) {
      resultText = 'You are .... strange?!';
      loadImage = 'assets/images/nervous.png';
    } else {
      resultText = 'You are so bad!';
      loadImage = 'assets/images/dislike.png';
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
          Image.asset(
            loadImage,
            width: 200,
            height: 100,
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
