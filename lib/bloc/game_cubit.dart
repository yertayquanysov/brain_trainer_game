import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamx/models/object_model.dart';
import 'package:gamx/repositories/game_repository.dart';

import 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  final GameRepository _gameRepository;

  GameCubit(this._gameRepository) : super(GameLoading());

  void onTapped(ObjectModel object) {
    _gameRepository.onGridTap(object, (isError) {
      if (isError) {
        emit(ItemTapError());
      }

      load();
    });
  }

  void load() {
    emit(GameLoading());

    final items = _gameRepository.showClickableItems();
    final score = _gameRepository.getScore();

    emit(GameLoaded(items, score));
  }
}
