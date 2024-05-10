import 'dart:async';

import 'package:flutter/material.dart';

import 'QuizActivity.dart';
import 'QuizModel.dart'; // Asegúrate de importar el modelo de pregunta

class QuizActivity extends StatefulWidget {
  final List<QuestionModel> questionModelList;
  final String time;

  QuizActivity({required this.questionModelList, required this.time});

  @override
  _QuizActivityState createState() => _QuizActivityState();
}

class _QuizActivityState extends State<QuizActivity> {
  int currentQuestionIndex = 0;
  String selectedAnswer = "";
  int score = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    int totalTimeInMillis = int.parse(widget.time) * 60 * 1000;
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        totalTimeInMillis -= 1000;
      });
      if (totalTimeInMillis <= 0) {
        timer.cancel();
        // Finish the quiz
      }
    });
  }

  void loadQuestions() {
    setState(() {
      selectedAnswer = "";
    });
    if (currentQuestionIndex == widget.questionModelList.length) {
      finishQuiz();
      return;
    }
  }

  void finishQuiz() {
    int totalQuestions = widget.questionModelList.length;
    int percentage = ((score / totalQuestions) * 100).toInt();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            percentage > 60 ? "¡Felicidades! Has pasado la prueba" : "¡Mmm! Examen reprobado",
            style: TextStyle(color: percentage > 60 ? Colors.blue : Colors.red),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LinearProgressIndicator(
                value: percentage / 100,
              ),
              Text("$percentage%"),
              Text("$score de $totalQuestions preguntas están correctas"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
                Navigator.of(context).pushReplacement( // Reinicia la actividad actual
                  MaterialPageRoute(builder: (BuildContext context) => MainActivity()),
                );
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Preguntas ${currentQuestionIndex + 1}/${widget.questionModelList.length}",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            LinearProgressIndicator(
              value: (currentQuestionIndex / widget.questionModelList.length),
            ),
            SizedBox(height: 16.0),
            Text(
              widget.questionModelList[currentQuestionIndex].question,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: widget.questionModelList[currentQuestionIndex].options.map((option) {
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedAnswer = option;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedAnswer == option ? Colors.orange : Colors.grey,
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                  ),
                  child: Text(option),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (selectedAnswer.isNotEmpty) {
                  setState(() {
                    if (selectedAnswer == widget.questionModelList[currentQuestionIndex].correct) {
                      score++;
                    }
                    currentQuestionIndex++;
                  });
                  loadQuestions();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Por favor, selecciona una respuesta para continuar.")),
                  );
                }
              },
              child: Text("Siguiente"),
            ),
          ],
        ),
      ),
    );
  }
}