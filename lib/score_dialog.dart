import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  final int totalQuestions;
  final int correctAnswers;

  ScoreWidget({required this.totalQuestions, required this.correctAnswers});

  @override
  Widget build(BuildContext context) {
    double percentage = (correctAnswers / totalQuestions) * 100;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          percentage >= 60 ? "¡Felicidades! Has pasado la prueba" : "¡Mmm! Examen reprobado",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: percentage >= 60 ? Colors.green : Colors.red), // Cambia el color del texto según el resultado
        ),
        SizedBox(height: 16),
        Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: percentage / 100, // Usa el porcentaje calculado para la barra de progreso
              backgroundColor: Colors.grey[300], // Cambia el color del fondo de la barra de progreso
              strokeWidth: 8,
            ),
            Text(
              "${percentage.toStringAsFixed(0)}%", // Mostrar el porcentaje redondeado sin decimales
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black), // Cambia el color del texto según el resultado
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          "$correctAnswers de $totalQuestions preguntas están correctas",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            // Acción al presionar el botón
          },
          child: Text("Terminar"),
        ),
      ],
    );
  }
}