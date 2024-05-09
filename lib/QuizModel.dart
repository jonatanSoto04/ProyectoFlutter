class QuizModel {
  final String id;
  final String title;
  final String subtitle;
  final String time;
  final List<QuestionModel> questionList;

  QuizModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.questionList,
  });

  factory QuizModel.empty() => QuizModel(
    id: "",
    title: "",
    subtitle: "",
    time: "",
    questionList: [],
  );
}

class QuestionModel {
  final String question;
  final List<String> options;
  final String correct;

  QuestionModel({
    required this.question,
    required this.options,
    required this.correct,
  });

  factory QuestionModel.empty() => QuestionModel(
    question: "",
    options: [],
    correct: "",
  );
}