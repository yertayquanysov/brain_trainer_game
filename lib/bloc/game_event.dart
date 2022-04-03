import 'package:equatable/equatable.dart';

abstract class GameEvent extends Equatable {}

class LoadGame extends GameEvent {
  @override
  List<Object?> get props => [];
}

class GameEnd extends GameEvent {
  @override
  List<Object?> get props => [];
}
