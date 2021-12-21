import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamx/repositories/game_repository.dart';

import 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  final GameRepository _gameRepository;

  GameCubit(this._gameRepository) : super(GameLoading());

  void load() {
    emit(GameLoading());

    final items = _gameRepository.generateGridItems();

    emit(GameLoaded(items));
  }
}
