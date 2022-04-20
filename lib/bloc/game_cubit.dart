import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamx/bloc/game_event.dart';
import 'package:gamx/models/object_model.dart';
import 'package:gamx/repositories/game_repository.dart';

import 'game_state.dart';

class GameCubit extends Bloc<GameEvent, GameState> {
  final GameRepository _gameRepository;

  List<ObjectModel> _items = [];
  List<ObjectModel> _activeCells = [];
  int _score = 0;

  bool _clickDisabled = true;

  GameCubit(this._gameRepository) : super(GameLoading()) {
    on<LoadGame>(loadGame);

    on<GameEnd>((event, emit) {
      emit(GameTimeOut());
    });

    on<GenerateNewCells>((event, emit) {

      _items = _gameRepository.showClickableItems();
      _activeCells = _items.where((cell) => cell.isActive == true).toList();
      _score = _gameRepository.getScore();

      Timer(Duration(seconds: 1), () {
        add(UpdateCells());
      });
    });

    on<UpdateCells>((event, emit) {
      emit(GameLoaded(_items, _score));
    });

    on<ClearCells>(clearShowedCells);

    on<ItemTapped>(checkTappedCell);
  }

  @override
  void onEvent(GameEvent event) {
    super.onEvent(event);

    if (event is GenerateNewCells) {
      add(ClearCells());
    }
  }

  void loadGame(event, emit) {
    emit(GameInfo());

    Timer(Duration(seconds: 2), () {
      add(GenerateNewCells());
    });
  }

  void clearShowedCells(event, emit) async {
    await Future.delayed(Duration(seconds: 2));

    _items = _items.map((e) => e.copyWith(isColored: false)).toList();
    _clickDisabled = false;

    add(UpdateCells());
  }

  void checkTappedCell(event, emit) {
    final ObjectModel tappedCell = event.cell;

    if (tappedCell.isColored || tappedCell.isError || _clickDisabled) return;

    if (_activeCells.contains(tappedCell)) {
      _items[tappedCell.index].copyWith(isColored: true);
    } else {
      _items[tappedCell.index].copyWith(isError: true);
    }

    add(UpdateCells());

    _gameRepository.onGridTap(tappedCell, () {
      add(GenerateNewCells());
    });
  }
}
