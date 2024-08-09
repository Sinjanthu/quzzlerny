class Question {
  String questionText = "";
  bool questionAnswer = false;

  Question({String q = "", bool a = false}) {
    questionAnswer = a;
    questionText = q;
  }
}
