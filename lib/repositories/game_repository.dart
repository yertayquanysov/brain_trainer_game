import 'package:flutter/material.dart';
import 'package:gamx/config.dart';
import 'package:gamx/extensions.dart';

import '../models/object_model.dart';

abstract class GameRepository {
  void setGridCount(int count);

  void onGridTap(ObjectModel gridItem, VoidCallback onRefresh);

  List<ObjectModel> showClickableItems();

  int getScore();
}

class GameRepositoryImpl implements GameRepository {
  int gridCount = defaultGridCount;

  List<ObjectModel> _generatedObjects = [];
  List<int> lastActivePositions = [];

  int _successTapCount = 0;
  int _successWinCount = 0;
  int _failedTapCount = 0;

  @override
  void setGridCount(int count) => gridCount = count;

  GameRepositoryImpl() {
    _generatedObjects =
        List.generate(gridCount, (idx) => ObjectModel(index: idx)).toList();
  }

  int getScore() => _successWinCount;

  List<ObjectModel> newObjects() {
    return _generatedObjects.map((e) => e.resetState()).toList();
  }

  @override
  List<ObjectModel> showClickableItems() {
    _successTapCount = 0;
    _failedTapCount = 0;

    lastActivePositions =
        generateItemPositions(positionCount: 3, max: gridCount);

    List<ObjectModel> newCells = newObjects();

    logger.i(lastActivePositions);

    lastActivePositions.forEach((index) {
      newCells[index] = newCells[index].copyWith(
        isActive: true,
        isColored: true,
      );
    });

    _generatedObjects = newCells;

    return _generatedObjects;
  }

  void onGridTap(ObjectModel cell, VoidCallback onRefresh) {
    if (cell.isActive && !cell.isTapped) {
      _successTapCount += 1;
      _generatedObjects[cell.index] =
          _generatedObjects[cell.index].copyWith(isTapped: true);
    } else {
      _failedTapCount += 1;
    }

    if (_failedTapCount == 2) {
      onRefresh();
    }

    logger.i(_failedTapCount);

    if (_successTapCount == 3) {
      _successWinCount += 1;
      onRefresh();
    }
  }
}
