import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamx/bloc/game_cubit.dart';
import 'package:gamx/bloc/game_event.dart';
import 'package:gamx/bloc/game_state.dart';
import 'package:gamx/components/game_finished.dart';
import 'package:gamx/components/game_info.dart';
import 'package:gamx/components/game_progress_bar.dart';
import 'package:gamx/components/grid_item.dart';
import 'package:gamx/components/point.dart';
import 'package:gamx/models/object_model.dart';
import 'package:gamx/repositories/game_repository.dart';
import 'package:get/get.dart';

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
    _gameCubit = GameCubit(_gameRepository);
    _gameCubit.add(LoadGame());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Миды жаттықтыру"),
      ),
      body: Container(
        child: BlocConsumer(
          bloc: _gameCubit,
          listener: (BuildContext context, Object? state) {
            if (state is ItemTapError) {
              Get.showSnackbar(GetBar(
                message: "Қате!",
                duration: Duration(milliseconds: 800),
              ));
            }
          },
          builder: (BuildContext context, state) {

            if (state is GameInfo) {
              return GameInfoWidget();
            }

            if (state is GameLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Point(score: state.score),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 5,
                      children: mappingItems(state.items),
                    ),
                  ),
                ],
              );
            }

            if (state is GameTimeOut) {
              return GameFinished(score: 1);
            }

            return GameProgressBar();
          },
        ),
      ),
    );
  }

  List<Widget> mappingItems(List<ObjectModel> items) {
    return items.map((cell) {
      return GridItem(
        color: changeColor(cell),
        onPressed: () => _gameCubit.add(ItemTapped(cell)),
      );
    }).toList();
  }

  Color changeColor(ObjectModel grid) {
    if (grid.isColored) {
      return Colors.greenAccent;
    }

    if (grid.isError) {
      return Colors.redAccent;
    }

    return Colors.white;
  }
}
