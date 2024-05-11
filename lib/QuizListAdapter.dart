import 'package:flutter/material.dart';
import 'package:primeraapp/quiz.dart';
import 'QuizModel.dart';
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
            _startQuiz(context, quizModelList[index]);
          },
          child: Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                title: Text(
                  quizModelList[index].title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  quizModelList[index].subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text('${quizModelList[index].time} min'),
              ),
            ),
          ),
        );
      },
    );
  }

  void _startQuiz(BuildContext context, QuizModel quizModel) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizActivity(
          questionModelList: quizModel.questionList,
          time: quizModel.time,
        ),
      ),
    );
  }
}