import 'package:flutter/material.dart';
import 'package:gamx/components/select_lavel_item.dart';

class SelectLevelScreen extends StatelessWidget {
  const SelectLevelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Level"),
      ),
      body: Column(
        children: [
          SelectLevelItem(
            name: "10x10",
          )
        ],
      ),
    );
  }
}
