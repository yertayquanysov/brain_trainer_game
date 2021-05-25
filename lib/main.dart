import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gamx/components/grid_item.dart';
import 'package:gamx/config.dart';
import 'package:gamx/object_model.dart';
import 'package:gamx/repositories/game_repository.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              return Text(e.toString());
            }

            if (snapshot.hasData) {
              return Wrap(
                children: snapshot.data,
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
