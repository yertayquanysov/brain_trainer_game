import 'package:equatable/equatable.dart';

class ObjectModel extends Equatable {
  const ObjectModel({
    required this.index,
    this.isActive = false,
    this.isTapped = false,
    this.isColored = false,
    this.isError = false,
  });

  final int index;
  final bool isActive;
  final bool isTapped;
  final bool isColored;
  final bool isError;

  ObjectModel resetState() {
    return ObjectModel(
      index: this.index,
      isActive: false,
      isTapped: false,
      isColored: false,
      isError: false,
    );
  }

  ObjectModel errorTap() {
    return ObjectModel(
      index: this.index,
      isError: true,
      isColored: false,
    );
  }

  ObjectModel hideColor() {
    return ObjectModel(
      index: this.index,
      isColored: false,
    );
  }

  ObjectModel copyWith({
    bool? isActive,
    bool? isTapped,
    bool? isColored,
    bool? isError,
  }) {
    return ObjectModel(
      index: this.index,
      isActive: isActive ?? this.isActive,
      isError: isError ?? this.isError,
      isColored: isColored ?? this.isColored,
      isTapped: isTapped ?? this.isTapped,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [index];
}
