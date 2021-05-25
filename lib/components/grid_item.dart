import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final Color color;
  final int index;
  final VoidCallback onPressed;

  GridItem({
    this.color = Colors.white,
    @required this.index,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width / 5,
        height: MediaQuery.of(context).size.width / 5,
        child: Card(
          color: color,
          margin: const EdgeInsets.all(5),
          shadowColor: Colors.white10,
        ),
      ),
    );
  }
}
