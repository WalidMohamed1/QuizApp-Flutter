import 'package:flutter/material.dart';
import 'main.dart';
// ignore_for_file: prefer_const_constructors

class Result extends StatelessWidget {
  final VoidCallback q;
  final int resultScore;

  Result(this.q, this.resultScore);

  String get resultPharse {
    String resultText;
    if (resultScore >= 4) {
      resultText = "You are awesome !";
    } else if (resultScore >= 2) {
      resultText = "Pretty likable !";
    } else {
      resultText = "You are so bad !";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        "Your score is $resultScore/5",
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: b),
        textAlign: TextAlign.center,
      ),
      Text(
        resultPharse,
        style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: b),
        textAlign: TextAlign.center,
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
              fontSize: 30,
            ),
            primary: Colors.purple,
            onPrimary: Colors.white),
        child: Text("Restart The App"),
        onPressed: q,
      )
    ]));
  }
}
