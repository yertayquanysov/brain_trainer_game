import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gamx/components/grid_item.dart';
import 'package:gamx/repositories/game_repository.dart';

import '../config.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final GameRepository _gameRepository = GameRepositoryImpl();
  final StreamController<List<GridItem>> _streamController = StreamController();

  @override
  void initState() {
    super.initState();

    _gameRepository.setGridCount(DEFAULT_GRID_COUNT);
    _gameRepository.setGameStream(_streamController);
    _gameRepository.generateGridItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarText),
      ),
      body: Container(
        height: MediaQuery.of(context).size.width,
        child: StreamBuilder<List<GridItem>>(
          stream: _streamController.stream,
          builder: (context, snapshot) {

            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            if (snapshot.hasData) {
              return GridView.count(
                crossAxisCount: 5,
                children: snapshot.data!,
              );
            }

            return const Text("No");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () => _gameRepository.showClickableItems(),
      ),
    );
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}
