import 'package:flutter/material.dart';
import 'package:gamx/screens/game_screen.dart';
import 'package:get/get.dart';
import 'package:superellipse_shape/superellipse_shape.dart';

class SelectLevelItem extends StatelessWidget {
  final String name;

  const SelectLevelItem({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: () => Get.to(GameScreen()),
        child: Card(
          color: Colors.deepOrange,
          shape: SuperellipseShape(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
