import 'package:first_app/quiz.dart';
import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors
main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

Color w = Colors.white;
Color b = Colors.black87;

class _MyAppState extends State<MyApp> {
  bool isSwitched = false;
  int _totalScore = 0;
  int _questionIndex = 0;

  final List<Map<String, Object>> _question = [
    {
      'questionText': 'How many hearts does an octopus have ?',
      'answers': [
        {'text': '2', 'score': 0},
        {'text': '4', 'score': 0},
        {'text': '1', 'score': 0},
        {'text': '3', 'score': 1}
      ],
    },
    {
      'questionText': 'Who is the inventor of the calculator ?',
      'answers': [
        {'text': 'Blaise Pascal', 'score': 1},
        {'text': 'Al-Khwarizmi', 'score': 0},
        {'text': 'Pythagoras', 'score': 0},
        {'text': 'Euclid', 'score': 0}
      ],
    },
    {
      'questionText': 'Which is the first country to win the FIFA World Cup ?',
      'answers': [
        {'text': 'Italy', 'score': 0},
        {'text': 'Germany', 'score': 0},
        {'text': 'Brazil', 'score': 0},
        {'text': 'Uruguay', 'score': 1},
      ],
    },
    {
      'questionText': 'Which is the smallest country in the world ?',
      'answers': [
        {'text': 'Bahrain', 'score': 0},
        {'text': 'Vatican', 'score': 1},
        {'text': 'Qatar', 'score': 0},
        {'text': 'Japan', 'score': 0},
      ],
    },
    {
      'questionText': '1, 3, 6, 10, 15,...',
      'answers': [
        {'text': '19', 'score': 0},
        {'text': '20', 'score': 0},
        {'text': '21', 'score': 1},
        {'text': '22', 'score': 0},
      ],
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            "Quiz App",
            style: TextStyle(color: w),
          ),
          actions: [
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  if (isSwitched == true) {
                    b = Colors.white;
                    w = Colors.black87;
                  }
                  if (isSwitched == false) {
                    b = Colors.black87;
                    w = Colors.white;
                  }
                });
              },
              activeColor: Colors.white,
              inactiveThumbColor: Colors.black87,
              inactiveTrackColor: Colors.white54,
            ),
          ],
        ),
        body: Container(
            color: w,
            child: _questionIndex < _question.length
                ? Quiz(_question, _questionIndex, _answerQuestion)
                : Result(_resetQuiz, _totalScore)),
      ),
    );
  }
}
