import 'package:flutter/material.dart';
import 'package:untitled/questions.dart';

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
  List<Question> questionBank = [
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Question(q: 'A slug\'s blood is green.', a: true),
    Question(q: 'Penguins can fly.', a: false),
    Question(q: 'The ocean is salty.', a: true),
    Question(q: 'The Earth is round.', a: true),
    Question(q: 'The sun is a giant ball of fire', a: true),
    Question(q: 'Apples grow on vines.', a: false)
  ];

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
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[questionNumber].questionText,
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
                bool correctAnswer =
                    questionBank[questionNumber].questionAnswer;
                if (correctAnswer == true) {
                  setState(() {
                    if (questionNumber <= 2) {
                      questionNumber++;
                      scorekeeper.add(const Icon(
                        Icons.check,
                        color: Colors.green,
                      ));
                    } else {
                      questionNumber = 0;
                    }
                    ;
                  });
                } else {
                  setState(() {
                    if (questionNumber <= 2) {
                      questionNumber++;
                      scorekeeper.add(const Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    } else {
                      questionNumber = 0;
                    }
                    ;
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
                bool correctAnswer =
                    questionBank[questionNumber].questionAnswer;

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
