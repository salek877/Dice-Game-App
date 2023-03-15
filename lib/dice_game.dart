import 'dart:math';

import 'package:flutter/material.dart';

class DiceGame extends StatefulWidget {
  const DiceGame({Key? key}) : super(key: key);

  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  var random = Random.secure();
  var dices = [
    'images/d1.png',
    'images/d2.png',
    'images/d3.png',
    'images/d4.png',
    'images/d5.png',
    'images/d6.png',
  ];
  var index = 0;
  bool isStarted = false;
  var score = 0;

  _changeDice(){
   setState(() {
     index = random.nextInt(6);
     score += index + 1;
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(isStarted)Text('Score: $score', style: TextStyle(fontSize: 30.0),),
            SizedBox(
              height: 80.0,
            ),
            if(isStarted)Image.asset(dices[index], width: 150.0, height: 150.0,),
            SizedBox(
              height: 20.0,),

            if(!isStarted)ElevatedButton(
                child: Text('Start',),
                onPressed: () {
                  setState(() {
                    isStarted = true;
                  });
                  _changeDice();
                }),
            if(isStarted)ElevatedButton(
                child: Text('Roll The Dice',),
                onPressed: () {
                  _changeDice();
                }),
          ],
        ),
      ),
    );
  }
}
