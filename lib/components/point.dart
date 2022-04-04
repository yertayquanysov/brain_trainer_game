import 'package:flutter/material.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';

class Point extends StatelessWidget {
  final int score;

  const Point({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: AnimatedFlipCounter(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
        value: score,
        prefix: "Бал: ",
        textStyle: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }
}
