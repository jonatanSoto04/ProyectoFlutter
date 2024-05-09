import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:primeraapp/quiz.dart';

import 'QuizModel.dart'; // Asegúrate de importar la actividad de quiz
import 'QuizActivity.dart';
class QuizListAdapter extends StatelessWidget {
  final List<QuizModel> quizModelList;

  QuizListAdapter(this.quizModelList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: quizModelList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuizActivity(
                  questionModelList: quizModelList[index].questionList,
                  time: quizModelList[index].time,
                ),
              ),
            );
          },
          child: QuizListItem(quizModel: quizModelList[index]),
        );
      },
    );
  }
}

class QuizListItem extends StatelessWidget {
  final QuizModel quizModel;

  QuizListItem({required this.quizModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(quizModel.title),
      subtitle: Text(quizModel.subtitle),
      trailing: Text('${quizModel.time} min'),
    );
  }
}