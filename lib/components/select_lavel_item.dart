import 'package:flutter/material.dart';
import 'package:gamx/screens/game_screen.dart';
import 'package:get/get.dart';

class SelectLevelItem extends StatelessWidget {
  final String name;

  const SelectLevelItem({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        name,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      onPressed: () => Get.to(GameScreen()),
    );
  }
}
