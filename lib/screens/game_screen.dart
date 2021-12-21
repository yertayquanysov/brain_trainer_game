import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamx/bloc/game_cubit.dart';
import 'package:gamx/bloc/game_state.dart';
import 'package:gamx/components/game_progress_bar.dart';
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

  late final GameCubit _gameCubit;

  @override
  void initState() {
    super.initState();

    _gameRepository.setGridCount(defaultGridCount);
    _gameRepository.generateGridItems();

    _gameCubit = GameCubit(_gameRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarText),
      ),
      body: Container(
        child: BlocBuilder(
          bloc: _gameCubit,
          builder: (BuildContext context, state) {
            if (state is GameLoaded) {
              return GridView.count(
                crossAxisCount: 5,
                children: state.items,
              );
            }

            if (state is GameTimeOut) {
              return Text("Finished");
            }

            return GameProgressBar();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () => _gameCubit.load(),
      ),
    );
  }
}
