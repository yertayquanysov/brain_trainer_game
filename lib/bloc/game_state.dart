import 'package:gamx/components/grid_item.dart';

abstract class GameState {}

class GameLoaded extends GameState {
  final List<GridItem> items;

  GameLoaded(this.items);
}

class GameTimeOut extends GameState {}

class GameLoading extends GameState {}
