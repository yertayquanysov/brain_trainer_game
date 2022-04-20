import 'package:gamx/models/object_model.dart';

abstract class GameState {}

class GameLoaded extends GameState {
  final List<ObjectModel> items;
  final int score;

  GameLoaded(this.items, this.score);
}

class GameTimeOut extends GameState {}

class GameLoading extends GameState {}

class GameInfo extends GameState {}

class ItemTapError extends GameState {}
