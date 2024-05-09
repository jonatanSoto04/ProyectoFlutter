import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Felicidades! Has pasado la prueba",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        const Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: 0.5, // Cambia el valor según sea necesario
              backgroundColor: Colors.grey,
              strokeWidth: 8,
            ),
            Text(
              "50%",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          "6 de 10 preguntas están correctas",
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