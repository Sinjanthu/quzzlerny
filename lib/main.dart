import 'package:flutter/material.dart';
import 'package:untitled/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

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

  void wrongAnswer(bool userPickedAnswer) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
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
                bool correctAnswer = quizBrain.getQuestionAnswer();
                if (correctAnswer == true) {
                  setState(() {
                    quizBrain.nextQuestion();
                    scorekeeper.add(const Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  });
                } else {
                  setState(() {
                    quizBrain.nextQuestion();
                    scorekeeper.add(const Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  });
                }
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
                bool correctAnswer = quizBrain.getQuestionAnswer();
                if (correctAnswer == false) {
                  setState(() {
                    quizBrain.nextQuestion();
                    scorekeeper.add(const Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  });
                } else {
                  setState(() {
                    quizBrain.nextQuestion();
                    scorekeeper.add(const Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  });
                }
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
