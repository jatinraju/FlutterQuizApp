import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter <= 0) {
        _counter = 0;
      } else {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Increment/Decrement"),
      ),
      body: Column(children: <Widget>[
        Text(
          "You have pressed the button this many times:",
          style: TextStyle(fontSize: 20),
        ),
        Text('$_counter', style: TextStyle(fontSize: 30)),
        RaisedButton(child: Icon(Icons.add), onPressed: _incrementCounter),
        RaisedButton(child: Icon(Icons.remove), onPressed: _decrementCounter)
      ]),
    ));
  }
}
