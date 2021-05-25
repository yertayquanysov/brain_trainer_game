import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gamx/components/grid_item.dart';
import 'package:gamx/config.dart';
import 'package:gamx/extensions.dart';

import '../object_model.dart';

abstract class GameRepository {
  void generateGridItems();

  void setGridCount(int count);

  void showClickableItems();

  void setGameStream(StreamController<List<GridItem>> streamController);
}

class GameRepositoryImpl implements GameRepository {
  int gridCount = DEFAULT_GRID_COUNT;

  late StreamController<List<GridItem>> _streamController;
  List<ObjectModel> _generatedObjects = [];
  List<int> lastPositions = [];
  int successTapCount = 0;

  @override
  void setGridCount(int count) => gridCount = count;

  @override
  void setGameStream(StreamController<List<GridItem>> streamController) =>
      _streamController = streamController;

  GameRepositoryImpl() {
    _generatedObjects = List.generate(
      gridCount,
      (idx) => ObjectModel(index: idx),
    ).toList();
  }

  @override
  void generateGridItems() {
    final gridItems = _generatedObjects
        .map(
          (e) => GridItem(
            index: e.index,
            color: e.isShowed ? Colors.greenAccent : Colors.white,
            onPressed: () => onGridTap(e),
          ),
        )
        .toList();

    _streamController.sink.add(gridItems);
  }

  List<ObjectModel> clearActiveObjects() {
    return _generatedObjects.map((e) => e.changeState()).toList();
  }

  @override
  void showClickableItems() {
    successTapCount = 0;
    lastPositions = generateItemPositions(positionCount: 3, max: gridCount);

    final List<ObjectModel> newObjects = clearActiveObjects();

    lastPositions.forEach((index) => newObjects[index].isShowed = true);

    _generatedObjects = newObjects;

    generateGridItems();
  }

  onGridTap(ObjectModel gridItem) {

    if (gridItem.isShowed && !gridItem.isClicked) {
      successTapCount++;
      _generatedObjects[gridItem.index].isClicked = true;
    }

    showClickableItems();

    if (_generatedObjects.where((element) => element.isClicked).length >= 3) {

    }
  }
}
