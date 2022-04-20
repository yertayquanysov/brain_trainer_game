import 'package:flutter/material.dart';

class GameInfoWidget extends StatelessWidget {
  const GameInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(50),
        child: Text(
          "Жасырылған ұяшықтарды табу керек.",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black45,
          ),
        ),
      ),
    );
  }
}
