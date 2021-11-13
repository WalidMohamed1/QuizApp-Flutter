import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

class Answer extends StatelessWidget {
  final String answerText;
  final VoidCallback x;

  Answer(this.x, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              textStyle: TextStyle(fontSize: 25, color: Colors.white),
              primary: Colors.purple),
          onPressed: x,
          child: Text(answerText),
        ));
  }
}
