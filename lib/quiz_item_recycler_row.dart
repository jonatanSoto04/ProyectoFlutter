import 'package:flutter/material.dart';

class QuizHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Android",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue), // Cambia el color del texto si es necesario
                ),
                SizedBox(height: 4),
                Text(
                  "All about Android OS",
                  style: TextStyle(fontSize: 14, color: Colors.grey), // Cambia el color del texto si es necesario
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icon_timer.png", // Asegúrate de que la imagen esté en la carpeta "assets"
                width: 32,
                height: 32,
                color: Colors.orange, // Cambia el color de la imagen si es necesario
              ),
              SizedBox(height: 4),
              Text(
                "20 min",
                style: TextStyle(fontSize: 14, color: Colors.grey), // Cambia el color del texto si es necesario
              ),
            ],
          ),
        ],
      ),
    );
  }
}