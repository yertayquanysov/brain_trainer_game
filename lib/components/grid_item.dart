import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;

  GridItem({
    this.color = Colors.white,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 5,
      height: MediaQuery.of(context).size.width / 5,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Material(
          color: color,
          child: InkWell(
            onTap: onPressed,
            child: Container(),
          ),
        ),
      ),
    );
  }
}
