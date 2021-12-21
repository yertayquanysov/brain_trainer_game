import 'package:flutter/material.dart';
import 'package:gamx/components/select_lavel_item.dart';

class SelectLevelScreen extends StatelessWidget {
  const SelectLevelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Қосымшаның аты тұрады"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          runSpacing: 10,
          spacing: 10,
          children: List.generate(30, (index) => index + 1)
              .map((e) => SelectLevelItem(name: e.toString()))
              .toList(),
        ),
      ),
    );
  }
}
