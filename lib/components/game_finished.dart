import 'package:flutter/material.dart';

class GameFinished extends StatelessWidget {
  final int score;

  const GameFinished({
    Key? key,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Аяқталды!",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text("Ұпай: " + score.toString()),
        ],
      ),
    );
  }
}
