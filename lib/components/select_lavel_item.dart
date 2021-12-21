import 'package:flutter/material.dart';
import 'package:gamx/screens/game_screen.dart';
import 'package:get/get.dart';

class SelectLevelItem extends StatelessWidget {
  final String name;

  const SelectLevelItem({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Get.to(GameScreen()),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
