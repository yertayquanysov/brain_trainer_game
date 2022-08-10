import 'package:gamx/models/object_model.dart';

abstract class GameState {}

class GameLoaded extends GameState {
  final List<ObjectModel> items;
  final int score;
  final String displayTime;

  GameLoaded(this.items, this.score, this.displayTime);
}

class GameTimeOut extends GameState {

  GameTimeOut(this.score);

  final int score;
}

class GameLoading extends GameState {}

class GameInfo extends GameState {}

class ItemTapError extends GameState {}
