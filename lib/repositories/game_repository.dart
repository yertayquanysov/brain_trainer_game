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

  int successTapCount = 0;
  int successWinCount = 0;

  @override
  void setGridCount(int count) => gridCount = count;

  GameRepositoryImpl() {
    _generatedObjects =
        List.generate(gridCount, (idx) => ObjectModel(index: idx)).toList();
  }

  int getScore() => successWinCount;

  List<ObjectModel> clearActiveObjects() {
    return _generatedObjects.map((e) => e.resetState()).toList();
  }

  @override
  List<ObjectModel> showClickableItems() {
    successTapCount = 0;
    lastActivePositions =
        generateItemPositions(positionCount: 3, max: gridCount);

    final List<ObjectModel> newObjects = clearActiveObjects();

    lastActivePositions.forEach(
      (index) => newObjects[index].isShowed = true,
    );

    _generatedObjects = newObjects;

    return _generatedObjects;
  }

  void onGridTap(ObjectModel gridItem, VoidCallback onRefresh) {
    if (gridItem.isShowed && !gridItem.isClicked) {
      successTapCount++;
      _generatedObjects[gridItem.index].isClicked = true;
    }

    if (successTapCount >= 3) {
      successWinCount += 1;
      onRefresh();
    }
  }
}
