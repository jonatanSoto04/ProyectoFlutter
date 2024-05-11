import 'package:flutter/material.dart';
import 'QuizListAdapter.dart';
import 'QuizModel.dart';

class MainActivity extends StatefulWidget {
  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  List<QuizModel> quizModelList = [];
  QuizListAdapter? adapter;

  @override
  void initState() {
    super.initState();
    getDataFromFirebase();
  }

  void setupRecyclerView() {
    setState(() {
      adapter = QuizListAdapter(quizModelList);
    });
  }

  void getDataFromFirebase() {
    // Simulando obtener datos de Firebase
    List<QuestionModel> listQuestionModel = [
      QuestionModel(
        question: "Qué es Android",
        options: ["Lenguaje", "OS", "Producto", "Ninguna"],
        correct: 'OS',
      ),
      QuestionModel(
        question: "Quién es el dueño de Android",
        options: ["Apple", "Google", "Samsung", "Microsoft"],
        correct: "Google",
      ),
      QuestionModel(
        question: "Qué asistente utiliza Android",
        options: ["Siri", "Cortana", "Asistente de Google", "Alexa"],
        correct: "Asistente de Google",
      ),
    ];

    setState(() {
      quizModelList.add(
        QuizModel(
          id: "1",
          title: "Programacion",
          subtitle: "Toda la programación básica",
          time: "10",
          questionList: listQuestionModel,
        ),
      );
    });

    setupRecyclerView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Application'),
      ),
      body: Center(
        child: adapter != null
            ? adapter // Mostrar el adaptador si está disponible
            : CircularProgressIndicator(), // Mostrar un indicador de carga si no lo está
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainActivity(), // Aquí es donde se llama a tu actividad principal
    );
  }
}