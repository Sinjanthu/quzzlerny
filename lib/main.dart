import 'package:flutter/material.dart';

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper = [];
  int questionNumber = 0;
  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
    'The ocean is salty.',
    'Penguins can fly.',
    'The Earth is round.',
    'Seeds grow into plants. ',
    'All insects have six legs.',
    'The sun is a giant ball of fire.',
    'Apples grow on vines.',
    'All butterflies are colorful.'
  ];
  List<bool> answers = [
    false,
    true,
    true,
    true,
    false,
    true,
    true,
    true,
    true,
    false,
    true
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionNumber],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                bool correctAnswer = answers[questionNumber];
                if (correctAnswer == true) {
                  setState(() {
                    questionNumber++;
                    scorekeeper.add(const Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  });
                } else {
                  setState(() {
                    questionNumber++;
                    scorekeeper.add(const Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  });
                }
                ;
              },
              icon: const Icon(Icons.check, size: 25, color: Colors.white),
              label: const Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                bool correctAnswer = answers[questionNumber];
                if (correctAnswer == false) {
                  setState(() {
                    questionNumber++;
                    scorekeeper.add(const Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  });
                } else {
                  setState(() {
                    questionNumber++;
                    scorekeeper.add(const Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  });
                }
                ;
              },
              icon: const Icon(
                Icons.close,
                size: 25,
                color: Colors.white,
              ),
              label: const Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        ),
      ],
    );
  }
}
