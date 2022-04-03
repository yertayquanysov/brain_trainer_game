import 'package:flutter/material.dart';

class Point extends StatelessWidget {

  final int score;

  const Point({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Text(
        "Бал: " + score.toString(),
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
