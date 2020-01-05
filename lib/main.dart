import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red[600],
        ),
        body: DicePage(),
      ),
    ),
  );
}


class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  int getRoll(String dice) {
    final result = new Random().nextInt(6) +1;
    print('$dice dice roll ($result)');
    return result;
  }

  @override
  Widget build(BuildContext context) {
    leftDiceNumber  = getRoll('left');
    rightDiceNumber = getRoll('right');

    return Center(

      child: Row (
        children: <Widget>[
          Expanded (
            child: FlatButton (
              onPressed: () {
                setState(() {
                  leftDiceNumber = getRoll('left');
                });
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded (
            child: FlatButton (
              onPressed: () {
                setState(() {
                  rightDiceNumber = getRoll('right');
                });
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
