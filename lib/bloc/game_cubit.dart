import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamx/bloc/game_event.dart';
import 'package:gamx/components/game_finished.dart';
import 'package:gamx/extensions.dart';
import 'package:gamx/models/object_model.dart';
import 'package:gamx/repositories/game_repository.dart';

import 'game_state.dart';

class GameCubit extends Bloc<GameEvent, GameState> {
  final GameRepository _gameRepository;

  List<ObjectModel> _items = [];
  int _score = 0;

  bool _clickDisabled = true;

  GameCubit(this._gameRepository) : super(GameLoading()) {
    on<LoadGame>(loadGame);

    on<GameEnd>((event, emit) {
      emit(GameTimeOut());
    });
  }

  void onTapped(ObjectModel object) {
    if (object.isColored || object.isError || _clickDisabled) return;

    _gameRepository.onGridTap(object, (isError) {
      if (isError) {
        showError(object.index);
        return;
      }

      add(LoadGame());
    });
  }

  void showError(int errorTapIndex) {
    _clickDisabled = true;
    _items[errorTapIndex].isError = true;

    add(LoadGame());

    Timer(Duration(milliseconds: 300), () {
      add(LoadGame());
    });
  }

  void loadGame(event, emit) {
    emit(GameLoading());

    _items = _gameRepository.showClickableItems();
    _score = _gameRepository.getScore();

    emit(GameLoaded(_items, _score));

    Timer(Duration(seconds: 2), () {
      // TODO: fix
      final noColoredItems = _items.map((e) => e..isColored = false).toList();

      logger.w(_items.where((element) => element.isColored).length);

      _clickDisabled = false;
      emit(GameLoaded(noColoredItems, _score));
    });
  }
}
