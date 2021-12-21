import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gamx/components/grid_item.dart';
import 'package:gamx/config.dart';
import 'package:gamx/extensions.dart';

import '../models/object_model.dart';

abstract class GameRepository {
  List<GridItem> generateGridItems();

  void setGridCount(int count);

  void showClickableItems();
}

class GameRepositoryImpl implements GameRepository {
  int gridCount = defaultGridCount;

  List<ObjectModel> _generatedObjects = [];
  List<int> lastPositions = [];

  int successTapCount = 0;
  int successWinCount = 0;

  @override
  void setGridCount(int count) => gridCount = count;

  GameRepositoryImpl() {
    _generatedObjects =
        List.generate(gridCount, (idx) => ObjectModel(index: idx)).toList();
  }

  List<ObjectModel> clearActiveObjects() {
    return _generatedObjects.map((e) => e.changeState()).toList();
  }

  @override
  void showClickableItems() {
    successTapCount = 0;

    lastPositions = generateItemPositions(positionCount: 3, max: gridCount);

    final List<ObjectModel> newObjects = clearActiveObjects();

    lastPositions.forEach(
      (index) => newObjects[index].isShowed = true,
    );

    _generatedObjects = newObjects;

    generateGridItems();
  }

  void onGridTap(ObjectModel gridItem) {
    if (gridItem.isShowed && !gridItem.isClicked) {
      successTapCount++;
      _generatedObjects[gridItem.index].isClicked = true;
    }

    if (successTapCount >= 3) {
      successWinCount += 1;
      showClickableItems();
    }
  }

  @override
  List<GridItem> generateGridItems() {
    return _generatedObjects
        .map((e) => GridItem(
            color: e.isShowed ? Colors.greenAccent : Colors.white,
            onPressed: () => onGridTap(e)))
        .toList();
  }
}
