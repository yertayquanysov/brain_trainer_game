import 'package:equatable/equatable.dart';
import 'package:gamx/models/object_model.dart';

abstract class GameEvent extends Equatable {}

class LoadGame extends GameEvent {
  @override
  List<Object?> get props => [];
}

class GameEnd extends GameEvent {
  @override
  List<Object?> get props => [];
}

class GenerateNewCells extends GameEvent {
  @override
  List<Object?> get props => [];
}

class ClearCells extends GameEvent {
  @override
  List<Object?> get props => [];
}

class UpdateCells extends GameEvent {
  final List<ObjectModel> cells;

  UpdateCells(this.cells);

  @override
  List<Object?> get props => [cells];
}

class ItemTapped extends GameEvent {
  final ObjectModel cell;

  ItemTapped(this.cell);

  @override
  List<Object?> get props => [cell];
}

class UpdateTimeEvent extends GameEvent {
  UpdateTimeEvent(this.time);

  final int time;

  @override
  List<Object?> get props => [];
}
