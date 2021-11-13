import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';
// ignore_for_file: prefer_const_constructors

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(this.question, this.questionIndex, this.answerQuestion);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(question[questionIndex]['questionText']?.toString() ?? ''),
        ...(question[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']),
              answer['text']?.toString() ?? '');
        }).toList(),
      ],
    );
  }
}
